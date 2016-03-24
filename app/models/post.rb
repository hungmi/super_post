class Post < ActiveRecord::Base
  enum state: { hidden: 0, publish: 1 }
  enum availability: { available: 0, taken: 1 }
  enum post_type: { renting: 0, replacement: 1, matching: 2 }

  include Imageable
  include Tokenable

  default_scope { order(updated_at: :desc) }

  validates :price, :post_type, :description, :address, presence: true

  belongs_to :author, class_name: "User", foreign_key: :author_id
end
