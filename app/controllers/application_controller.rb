class ApplicationController < ActionController::API
  include Knock::Authenticable

  def self.pdf_temp_path
    "tmp/PDFs/"
  end
end
