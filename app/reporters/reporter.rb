require 'fileutils'

class Reporter
  def self.pdf_temp_path folder
    path = "public/PDFs/#{folder}/"
    FileUtils::mkdir_p path
    path
  end
end
