class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable, :omniauthable, :database_authenticatable

  has_many :posts, dependent: :destroy, foreign_key: :author_id

  def fb
    "https://www.facebook.com/#{uid}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.email = auth.info.email
    end
  end

  def has_draft?
    return self.posts.hidden.present?
  end
end
