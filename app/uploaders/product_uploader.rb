class ProductUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  
  version :medium do
    process resize_to_fill: [130, 130]
  end
   
  version :large do
    process resize_to_fill: [160, 160]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
   
  def extension_white_list
    %w(jpg jpeg gif png)
  end
   
  def default_url
    ActionController::Base.helpers.asset_path('default_product.png')
  end
 
end
