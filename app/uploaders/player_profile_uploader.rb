class PlayerProfileUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
   'uploads/pp_avatares'
 end

end
