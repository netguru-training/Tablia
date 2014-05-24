class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  version :medium do
    process resize_to_fill: [125, 125]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
   
  def extension_white_list
    %w(jpg jpeg gif png)
  end
 
end
