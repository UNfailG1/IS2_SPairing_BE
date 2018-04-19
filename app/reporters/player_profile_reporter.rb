class PlayerProfileReporter

  #Creates a PDF report for the given PlayerProfile
  #Param PlayerProfile is a PlayerProfile
  def self.createPlayerProfileReport(playerProfile)
    reportPlayerProfile(playerProfile)
  end

  #Creates a PDF report for the given collection of PlayerProfiles
  #Param collection is a collection of PlayerProfiles
  #Param collect_name is the name of the PDF to be created
  def self.createPlayerProfileCollectReport(collection, collect_name)
    reportPlayerProfileCollection(collection, collect_name)
  end

  private

  #Defines the path to be used on the reporter
  def self.pdf_temp_path
    'tmp/PDFs/Player Profile Report/'
  end

  #Defines how the PDF will be created
  #Param collection is a collection of PlayerProfiles
  #Param collect_name is the name of the PDF to be created
  def self.reportPlayerProfileCollection(collect, collect_name)
    file_name = pdf_temp_path + 'report_user_collect_' + collect_name + '.pdf'
    i = 0
    Prawn::Document.generate(file_name) do
      image "#{Rails.root}/assets/pdf_back.jpg", at: [-50, 900], fit: [700, 1000]
      collect.each do |playerProfile|
        text playerProfile.pp_username + " report", align: :center, size: 20
        text "Player's email: " + playerProfile.email, size: 16
        text 'Spairing elo: ' + playerProfile.pp_spairing_elo.to_s, size: 16
        if(i==10)
          break
        end
        i = i + 1
      end
    end
  end

  #Defines how the PDF will be created
  #Param PlayerProfile is a PlayerProfile
  def self.reportPlayerProfile(playerProfile)
    file_name = pdf_temp_path + playerProfile.pp_username + '.pdf'
    Prawn::Document.generate(file_name) do
      image "#{Rails.root}/assets/pdf_back.jpg", at: [-50, 900], fit: [700, 1000]
      text playerProfile.pp_username + " report", align: :center, size: 20
      text "Player's email: " + playerProfile.email, size: 18
      text 'Spairing elo: ' + playerProfile.pp_spairing_elo.to_s, size: 18
    end
  end

end
