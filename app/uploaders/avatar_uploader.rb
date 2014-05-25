class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  version :medium do
    process resize_to_fill: [125, 125]
  end

  # Use Heroku's temp folder for uploads
  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/default_avatar.jpeg")
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
