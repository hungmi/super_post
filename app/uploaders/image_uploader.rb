class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.token}"
  end

  def filename
    "original.#{file.extension}" if original_filename
  end

  def optimize
    manipulate! do |img|
      img.strip
      img.combine_options do |c|
        c.quality "80"
        c.depth "8"
        c.interlace "plane"
      end
      img
    end
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  process :resize_to_fit => [20000, 500]
  version :large do
    process :resize_to_fill => [450, 450]
  end
  version :medium do
    process :resize_to_fill => [300, 300]
  end
  version :small do
    process :resize_to_fill => [150, 150]
  end
  
end