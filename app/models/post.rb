class Post < ActiveRecord::Base
  enum status: { available: 0, taken: 1 }
  enum post_type: { renting: 0, replacement: 1, matching: 2 }

  validates :price, :post_type, :description, :address, presence: true
end
