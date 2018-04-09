class PlayerProfileReporter
  def self.createPlayerProfileReport(playerProfile)
    Prawn::Document.generate(ApplicationController.pdf_temp_path + "Player Profile Report/" + playerProfile.pp_username + ".pdf") do
      text "Player's username: " + playerProfile.pp_username
      text "Player's email: " + playerProfile.email
      text "Spairing elo: " + playerProfile.pp_spairing_elo
    end
  end
end
