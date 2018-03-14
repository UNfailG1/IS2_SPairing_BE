# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


#Defining functions to seed DB

def seedSponsorsAndAdds()
  print("================= SeedingDB:  Creating Sponsors and Ads =======================\n")          #Information about what will be performed
  start = Time.now                                                                                    #Recording start time
  for i in 1..20 do
    Sponsor.create(spo_name: Faker::Company.name)                                                     #Creating Sponsors
    10.times do
      product = Faker::Company.bs
      product_link = Faker::Internet.url('product.split(" ")[0]' + '.com')
      path = "ads/" + i.to_s + "/" + product.split(" ")[0] + "/main.jpg"
      Ad.create(ad_description: product, ad_link: product_link, ad_image_path: path, sponsor_id: i)   #Creating ads for Sponsors
    end
  end
  print("-- Added 20 fake Sponsors\n")
  print("-- Added 10 fake Ads per Sponsor\n")
  print("   -> " + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB:  Created Sponsors and Ads ========================\n")          #Informing about what was done
  print("\n")
end

def seedPlayerProfiles()
  print("================= SeedingDB - Creating Player Profiles ========================\n")
  start = Time.now
  for i in 1..15 do
    real_name = Faker::Name.name
    user_name = Faker::Internet.user_name(real_name)
    password = Faker::Internet.password(8, 20)
    email = Faker::Internet.free_email(real_name)
    PlayerProfile.create( pla_pro_real_name: real_name, pla_pro_user_name: user_name,
                          pla_pro_password: password, pla_pro_email: email, pla_sparing_elo: 0
                        )
  end
  print("-- Added 100 fake Player Profiles\n")
  print("   -> " + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created Player Profiles =========================\n")
  print("\n")
end

def seedLocations()
  print("================= SeedingDB - Creating Locations ==============================\n")
  start = Time.now
  for i in 1..15 do
    Location.create(loc_lat: Faker::Address.latitude, loc_lon: Faker::Address.longitude, loc_name: Faker::Address.community, player_profile_id: i)
  end
  print("-- Added 100 fake Locations\n")
  print("   -> " + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created Locations ===============================\n")
  print("\n")
end



seedSponsorsAndAdds
seedPlayerProfiles
seedLocations
