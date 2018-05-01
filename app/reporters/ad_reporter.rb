class AdReporter

  #Creates a PDF report for the given Ad
  #Param Ad is an Ad
  def self.createAdReport(ad)
    reportAd(ad)
  end

  #Creates a PDF report for the given collection of Ads
  #Param collection is a collection of Ads
  #Param collect_name is the name of the PDF to be created
  def self.createAdCollectReport(collection, collect_name)
    reportAdCollection(collection, collect_name)
  end

  private

  #Defines the path to be used on the reporter
  def self.pdf_temp_path
    Reporter.pdf_temp_path "Ad_Report"
  end

  #Defines how the PDF will be created
  #Param collection is a collection of Ads
  #Param collect_name is the name of the PDF to be created
  def self.reportAdCollection(collect, collect_name)
    file_name = pdf_temp_path + 'ad_collect_' + collect_name + '_' +
                Time.now.strftime("%Y%m%d%H%M%S") + '.pdf'
    i = 0
    Prawn::Document.generate(file_name) do
      image "#{Rails.root}/assets/pdf_back.jpg", at: [-50, 900], fit: [700, 1000]
      collect.each do |ad|
        text 'Ad# ' + ad.id.to_s + " report's", align: :center, size: 20
        text 'Ad description: ' + ad.ad_description, size: 18
        text 'Ad link: ' + ad.ad_link, size: 18
        text 'Ad sponsor: ' + ad.sponsor.spo_name, size: 18
        break if i == 7
        i += 1
      end
    end

    file_name
  end

  #Defines how the PDF will be created
  #Param Ad is an Ad
  def self.reportAd(ad)
    file_name = pdf_temp_path + ad.id.to_s + '_' + Time.now.strftime("%Y%m%d%H%M%S")
                + '.pdf'
    Prawn::Document.generate(file_name) do
      image "#{Rails.root}/assets/pdf_back.jpg", at: [-50, 900], fit: [700, 1000]
      text 'Ad# ' + ad.id.to_s + " report's", align: :center, size: 20
      text 'Ad description: ' + ad.ad_description, size: 18
      text 'Ad link: ' + ad.ad_link, size: 18
      text 'Ad sponsor: ' + ad.sponsor.spo_name, size: 18
    end

    file_name
  end
end
