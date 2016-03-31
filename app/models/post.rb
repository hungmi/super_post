class Post < ActiveRecord::Base
  enum state: { draft: 0, hidden: 1, publish: 2 }
  enum availability: { available: 0, taken: 1 }
  enum post_type: { renting: 0, replacement: 1, matching: 2 }

  include Imageable
  include Tokenable

  default_scope { order(updated_at: :desc) }

  validates :price, :post_type, :description, :city, :address, presence: true

  belongs_to :author, class_name: "User", foreign_key: :author_id, counter_cache: true

  # 驗證 enum 時需使用字串，不可使用整數，否則會被擋下
  def self.valid_attribute?(attr, value)
    mock = self.new(attr => value)
    unless mock.valid?
      return !mock.errors.has_key?(attr)
    end
    true
  end

  def self.valid_attributes?(params)
    params.each do |k,v|
      return false unless self.valid_attribute?(k,v)
    end
    true
  end

  def can_publish?
    self.valid? && self.attachments_count > 0
  end

  def i18n_short_type # for _post 用
    I18n.t("post_type.short.#{self.post_type}")
  end

  def self.i18n_types # for select 用
    I18n.t("post_type.long")
  end

  def full_address
    if self.city.blank? && self.address.blank?
      "尚未輸入地址"
    else
      "#{self.city}#{self.address}"
    end
  end
end
