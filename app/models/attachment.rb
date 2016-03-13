class Attachment < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  include Tokenable

  default_scope { order(:order, :id) }

  belongs_to :imageable, polymorphic: true, counter_cache: true

end
