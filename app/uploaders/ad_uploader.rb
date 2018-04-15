class AdUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
   'uploads/ads'
 end

end
