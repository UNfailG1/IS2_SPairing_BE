class AdUploader < CarrierWave::Uploader::Base
  storage :file

  def default_url(*args)
    "files/AdImages/" + [version_name, "default.png"].compact.join('_')
  end

end
