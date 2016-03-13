module Facebookable

  #before_action :has_sign_with_zuker?, only: [:edit, :phone_verify]

  extend ActiveSupport::Concern

  included do
    before_save :human?, if: :omniauth?
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
  
  class_methods do

    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        Rails.logger.debug(auth)
        user.provider = auth.provider
        user.uid = auth.uid
        if auth.info
          user.email = auth.info.try(:email)
          user.first_name = auth.info.try(:first_name)
          user.last_name = auth.info.try(:last_name)
          user.image = auth.info.try(:image)
        end
        #user.password = Devise.friendly_token[0,20]
        if auth.extra.raw_info
          user.friends = auth.extra.raw_info.try(:friends).try(:summary).try(:total_count).to_i
          user.school_name << auth.extra.raw_info.try(:education).try(:last).try(:school).try(:name)
          user.start_school_year = auth.extra.raw_info.try(:education).try(:last).try(:year).try(:name) || 'Not found.'
        end
      end
    end

  end


  # 當登入FB時，若有一個尚未連結FB的使用者已登入
  # 那就會透過這個方法將FB的資訊寫入目前的使用者
  def update_with_omniauth(auth)
    Rails.logger.debug(auth)
    fb_user = User.where(provider: auth.provider, uid: auth.uid).first
    if fb_user.present?
      self.merge_from(fb_user)
      fb_user.destroy if fb_user
    end
    self.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      if auth.info
        user.email = auth.info.try(:email)
        user.first_name = auth.info.try(:first_name)
        user.last_name = auth.info.try(:last_name)
        user.image = auth.info.try(:image)
      end
      if auth.extra.raw_info
        user.friends = auth.extra.raw_info.try(:friends).try(:summary).try(:total_count).to_i
        user.school_name << auth.extra.raw_info.try(:education).try(:last).try(:school).try(:name)
        user.start_school_year = auth.extra.raw_info.try(:education).try(:last).try(:year).try(:name) || 'Not found.'
      end
      user.save!
    end
  end

  def merge_from(user) # 專門拿來移動資產的
    user.houses.try(:each) do |house|
      house.update(owner: self)
    end
    user.comments.try(:each) do |comment|
      comment.update(commentable: self)
    end
    user.my_comments.try(:each) do |my_comment|
      my_comment.update(author: self)
    end
  end

  # 當一個fb_user透過connect_with_zuker登入一個正確的zuker帳號之後，
  # 會將目前fb_user的資料轉移到那個zuker，也就是以zuker為主，並消滅目前fb_user
  # ex: login_zuker.update_with_existing_fb_user(fb_user)
  def update_with_existing_fb_user(fb_user)
    self.tap do |login_zuker|
      login_zuker.update ({
        provider: fb_user.provider,
        uid: fb_user.uid,  
        email: fb_user.email,
        first_name: fb_user.first_name,
        last_name: fb_user.last_name,
        image: fb_user.image,
        friends: fb_user.friends,
        school_name: fb_user.school_name,
        start_school_year: fb_user.start_school_year
      })
      login_zuker.save
      login_zuker.merge_from(fb_user)
    end
  end

  def omniauth?
    provider.present?
  end


  def human?
    friends >= 50
  end
  
end