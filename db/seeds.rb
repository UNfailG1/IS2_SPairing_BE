# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Defining functions to seed DB

def seedSponsorsAndAds
  print("================= SeedingDB:  Creating Sponsors and Ads =======================\n")          # Information about what will be performed
  start = Time.now                                                                                    # Recording start time
  for i in 1..20 do
    Sponsor.create(spo_name: Faker::Company.name)
    ads_todo = Faker::Number.between(1, 10)                                                    # Creating Sponsors
    ads_todo.times do
      product = Faker::Company.bs
      product_link = Faker::Internet.url(product.split(' ')[0] + '.com')
      #path = 'ads/' + i.to_s + '/' + product.split(' ')[0] + '/main.jpg'
      Ad.create(ad_description: product, ad_link: product_link, sponsor_id: i) # Creating ads for Sponsors
    end
  end
  print("-- Added 20 fake Sponsors\n")
  print("-- Added 10 fake Ads per Sponsor\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB:  Created Sponsors and Ads ========================\n") # Informing about what was done
  print("\n")
end

def seedLocations
  print("================= SeedingDB - Creating Locations ==============================\n")
  start = Time.now
  for i in 1..15 do
    Location.create(loc_lat: Faker::Address.latitude, loc_long: Faker::Address.longitude, loc_name: Faker::Address.community)
  end
  print("-- Added 15 fake Locations\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created Locations ===============================\n")
  print("\n")
end

def seedPegi
  print("================= SeedingDB - Creating Platforms ==============================\n")
  start = Time.now
  Pegi.create(peg_name: '3 or older', peg_age: 3, peg_image: 'https://upload.wikimedia.org/wikipedia/commons/2/2c/PEGI_3.svg')
  Pegi.create(peg_name: '7 or older', peg_age: 7, peg_image: 'https://upload.wikimedia.org/wikipedia/commons/2/29/PEGI_7.svg')
  Pegi.create(peg_name: '12 or older', peg_age: 12, peg_image: 'https://upload.wikimedia.org/wikipedia/commons/4/44/PEGI_12.svg')
  Pegi.create(peg_name: '16 or older', peg_age: 16, peg_image: 'https://upload.wikimedia.org/wikipedia/commons/8/8a/PEGI_16.svg')
  Pegi.create(peg_name: '18 or older', peg_age: 18, peg_image: 'https://upload.wikimedia.org/wikipedia/commons/7/75/PEGI_18.svg')
  print("-- Added 5 Pegi\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created Platforms ===============================\n")
  print("\n")
end

def seedGenres
  print("================= SeedingDB - Creating Genres =================================\n")
  start = Time.now
  Genre.create(gen_name: 'Action', gen_views: 0)
  Genre.create(gen_name: 'Platform games', gen_views: 0)
  Genre.create(gen_name: 'Shooter games', gen_views: 0)
  Genre.create(gen_name: "Fighting games and beat 'em ups", gen_views: 0)
  Genre.create(gen_name: 'Stealth game', gen_views: 0)
  Genre.create(gen_name: 'Survival games', gen_views: 0)
  Genre.create(gen_name: 'Rhythm games', gen_views: 0)
  Genre.create(gen_name: 'Action-adventure', gen_views: 0)
  Genre.create(gen_name: 'Survival horror', gen_views: 0)
  Genre.create(gen_name: 'Metroidvania', gen_views: 0)
  Genre.create(gen_name: 'Adventure', gen_views: 0)
  Genre.create(gen_name: 'Text adventures', gen_views: 0)
  Genre.create(gen_name: 'Graphic adventures', gen_views: 0)
  Genre.create(gen_name: 'Visual novels', gen_views: 0)
  Genre.create(gen_name: 'Interactive movie', gen_views: 0)
  Genre.create(gen_name: 'Real-time 3D adventures', gen_views: 0)
  Genre.create(gen_name: 'Role-playing', gen_views: 0)
  Genre.create(gen_name: 'Action RPG', gen_views: 0)
  Genre.create(gen_name: 'MMORPG', gen_views: 0)
  Genre.create(gen_name: 'Roguelikes', gen_views: 0)
  Genre.create(gen_name: 'Tactical RPG', gen_views: 0)
  Genre.create(gen_name: 'Sandbox RPG', gen_views: 0)
  Genre.create(gen_name: 'First-person party-based RPG', gen_views: 0)
  Genre.create(gen_name: 'Cultural differences', gen_views: 0)
  Genre.create(gen_name: 'Choices', gen_views: 0)
  Genre.create(gen_name: 'Fantasy', gen_views: 0)
  Genre.create(gen_name: 'Simulation', gen_views: 0)
  Genre.create(gen_name: 'Construction and management simulation', gen_views: 0)
  Genre.create(gen_name: 'Life simulation', gen_views: 0)
  Genre.create(gen_name: 'Vehicle simulation', gen_views: 0)
  Genre.create(gen_name: 'Strategy', gen_views: 0)
  Genre.create(gen_name: '4X game', gen_views: 0)
  Genre.create(gen_name: 'Artillery game', gen_views: 0)
  Genre.create(gen_name: 'Real-time strategy (RTS)', gen_views: 0)
  Genre.create(gen_name: 'Real-time tactics (RTT)', gen_views: 0)
  Genre.create(gen_name: 'Multiplayer online battle arena (MOBA)', gen_views: 0)
  Genre.create(gen_name: 'Tower defense', gen_views: 0)
  Genre.create(gen_name: 'Turn-based strategy (TBS)', gen_views: 0)
  Genre.create(gen_name: 'Turn-based tactics (TBT)', gen_views: 0)
  Genre.create(gen_name: 'Wargame', gen_views: 0)
  Genre.create(gen_name: 'Grand strategy wargame', gen_views: 0)
  Genre.create(gen_name: 'Sports', gen_views: 0)
  Genre.create(gen_name: 'Racing', gen_views: 0)
  Genre.create(gen_name: 'Sports game', gen_views: 0)
  Genre.create(gen_name: 'Competitive', gen_views: 0)
  Genre.create(gen_name: 'Sports-based fighting', gen_views: 0)
  Genre.create(gen_name: 'Other notable genres', gen_views: 0)
  Genre.create(gen_name: 'MMO', gen_views: 0)
  Genre.create(gen_name: 'Casual game', gen_views: 0)
  Genre.create(gen_name: 'Party game', gen_views: 0)
  Genre.create(gen_name: 'Programming game', gen_views: 0)
  Genre.create(gen_name: 'Logic game', gen_views: 0)
  Genre.create(gen_name: 'Trivia game', gen_views: 0)
  Genre.create(gen_name: 'Board game / Card game', gen_views: 0)
  Genre.create(gen_name: 'Idle gaming', gen_views: 0)
  Genre.create(gen_name: 'Video game genres by purpose', gen_views: 0)
  Genre.create(gen_name: 'Advergame', gen_views: 0)
  Genre.create(gen_name: 'Art game', gen_views: 0)
  Genre.create(gen_name: 'Casual game', gen_views: 0)
  Genre.create(gen_name: 'Christian game', gen_views: 0)
  Genre.create(gen_name: 'Educational game', gen_views: 0)
  Genre.create(gen_name: 'Electronic sports', gen_views: 0)
  Genre.create(gen_name: 'Exergame', gen_views: 0)
  Genre.create(gen_name: 'Serious game', gen_views: 0)
  Genre.create(gen_name: 'Scientific studies', gen_views: 0)
  print("-- Added 65 fake Genres\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created Genres ==================================\n")
  print("\n")
end

def seedPlatforms
  print("================= SeedingDB - Creating Platforms ==============================\n")
  start = Time.now
  Platform.create(plat_name: 'Atari 7800', plat_link: 'http://www.atari.com', plat_views: 0)
  Platform.create(plat_name: 'Atari Jaguar', plat_link: 'http://www.atari.com', plat_views: 0)
  Platform.create(plat_name: 'Sega Mega Drive / Genesis', plat_link: 'http://www.sega.com', plat_views: 0)
  Platform.create(plat_name: 'Sega Saturn', plat_link: 'http://www.sega.com', plat_views: 0)
  Platform.create(plat_name: 'Sega DreamCast', plat_link: 'http://www.sega.com', plat_views: 0)
  Platform.create(plat_name: 'Microsoft Xbox', plat_link: 'http://www.microsoft.com', plat_views: 0)
  Platform.create(plat_name: 'Microsoft Xbox 360', plat_link: 'http://www.microsoft.com', plat_views: 0)
  Platform.create(plat_name: 'Microsoft Xbox One', plat_link: 'http://www.microsoft.com', plat_views: 0)
  Platform.create(plat_name: 'Sony PlayStation', plat_link: 'http://www.sony.com', plat_views: 0)
  Platform.create(plat_name: 'Sony PlayStation 2', plat_link: 'http://www.sony.com', plat_views: 0)
  Platform.create(plat_name: 'Sony PlayStation 3', plat_link: 'http://www.sony.com', plat_views: 0)
  Platform.create(plat_name: 'Sony PlayStation 4', plat_link: 'http://www.sony.com', plat_views: 0)
  Platform.create(plat_name: 'Sony PlayStation Vita', plat_link: 'http://www.sony.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo Entretainmen System', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Super Nintendo Entretainmen System', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo 64', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo Wii', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo Wii U', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo Switch', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo Game Boy', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo Game Boy Color', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo Game Boy Micro', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo Game Boy Advance SP', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo Game Boy Advance', plat_link: 'http://www.nintendo.com', plat_views: 0)
  Platform.create(plat_name: 'Nintendo Nintendo 3DS', plat_link: 'http://www.nintendo.com', plat_views: 0)
  print("-- Added 25 fake Plataforms\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created Platforms ===============================\n")
  print("\n")
end

def seedGames
  print("================= SeedingDB - Creating Games ==================================\n")
  start = Time.now
  for i in 1..15 do
    title = Faker::Book.title
    new_genres = []
    for i in 1..Faker::Number.between(1, 10)
      new_genres += [Genre.find(i)]
    end
    new_platforms = []
    for i in 1..Faker::Number.between(1, 10)
      new_platforms += [Platform.find(i)]
    end
    new_game = Game.create(gam_name: title, gam_description: Faker::Lovecraft.paragraph, gam_link: Faker::Internet.url(title + '.com'),
      pegi_id: Faker::Number.between(1, 5), gam_user_counter: 0, gam_views: 0)
    new_game.genres = new_genres
    new_game.platforms = new_platforms
  end
  print("-- Added 15 fake Games\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created Games ===================================\n")
  print("\n")
end

def seedPlayerProfilesAndPlayerGameProfiles
  print("================= SeedingDB - Creating Player Profiles ========================\n")
  start = Time.now
  for i in 1..15 do
    real_name = Faker::Name.name
    username = Faker::Internet.user_name(real_name)
    password = Faker::Internet.password(8, 20)
    email = Faker::Internet.free_email(real_name)
    location = Faker::Number.between(1, 15)
    PlayerProfile.create(pp_username: username, password_confirmation: password, password: password, location_id: location,
      email: email, pp_spairing_elo: Faker::Number.between(0, 5), pp_avatar: 'user.svg')
    reputation = Faker::Number.between(1, 5)
    player_nickname = Faker::Internet.user_name
    p_game_rate = Faker::Number.between(1, 5)
    player = i
    game = Faker::Number.between(1, 15)
    PlayerGameProfile.create(pgp_reputation: reputation, pgp_nickname: player_nickname, pgp_rate: p_game_rate, player_profile_id: player, game_id: game)
    Game.find(game).update_attribute(:gam_user_counter, Game.find(game).gam_user_counter + 1)
    print('   -> email: ' + email + ' password: ' + password + "\n")
  end
  print("-- Added 15 fake Player Profiles\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created Player Profiles =========================\n")
  print("\n")
end

def seedSubForum
  15.times do
    game = Game.find(Faker::Number.between(1, 15))
    SubForum.create(sf_name: Faker::Zelda.location + " " + Faker::Zelda.character, sf_description: Faker::LeagueOfLegends.quote, game: game)
  end
end

def seedMailBoxes
  print("================= SeedingDB - Creating Mailboxs ===============================\n")
  start = Time.now
  for i in 1..50 do
    sender = Faker::Number.between(1, 15)
    recever = Faker::Number.between(1, 15)
    msg = Faker::Hipster.sentence(10)
    Mailbox.create(sender_id: sender, receiver_id: recever, mail_message: msg)
  end
  print("-- Added 50 fake Mails\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created Mailboxs ================================\n")
  print("\n")
end

def seedPlayerFriends
  print("================= SeedingDB - Creating PlayerWhiteLists =======================\n")
  start = Time.now
  for i in 1..50 do
    player_id = Faker::Number.between(1, 15)
    player = PlayerProfile.find(player_id)
    friend_id = Faker::Number.between(1, 15)
    friend = PlayerProfile.find(friend_id)
    player.friends.push(friend)
    friend.friends.push(player)
  end
  print("-- Added 50 fake friend :'c\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created PlayerWhiteLists ========================\n")
  print("\n")
end

def seedPlayerBlokedList
  print("================= SeedingDB - Creating PlayerBlackLists =======================\n")
  start = Time.now
  for i in 1..50 do
    player = PlayerProfile.find(Faker::Number.between(1, 15))
    blocked = PlayerProfile.find(Faker::Number.between(1, 15))
    player.blocked_players.push(blocked)
  end
  print("-- Added 50 fake bad friend :'c\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created PlayerBlackLists ========================\n")
  print("\n")
end

def seedRatings
  # To do seeding

  # print("================= SeedingDB - Creating Ratings ================================\n")
  # start = Time.now
  # for i in 1..50 do
  #   sender = Faker::Number.between(1, 15)
  #   recever = Faker::Number.between(1, 15)
  #   rat = Faker::Number.between(1, 5)
  #   Rating.create(rat_rater_id: sender, rat_recever_id: recever, rat_rate: rat)
  # end
  # print("-- Added 50 fake Ratings\n")
  # print('   -> ' + (Time.now - start).to_s + "s\n")
  # print("================= SeedingDB - Created Ratings =================================\n")
  # print("\n")
end

def seedThreadForum
  print("================= SeedingDB - Creating Thread Forums and Comments =============\n")
  start = Time.now
  30.times do
    a = ThreadForum.create(thr_name: Faker::Zelda.item, thr_views: 0, thr_comments: 0, sub_forum: SubForum.find(Faker::Number.between(1, 15)))
    seedComments(a)
    a.save
  end
  print("-- Added 15 fake Thread Forums\n")
  print('   -> ' + (Time.now - start).to_s + "s\n")
  print("================= SeedingDB - Created Thread Forums and Comments ==============\n")
  print("\n")
end

def seedComments(thr_forum)
  comments_todo = Faker::Number.between(1, 20)
  comments_todo.times do
    Comment.create(com_comment: Faker::MostInterestingManInTheWorld.quote, thread_forum: thr_forum, player_profile: PlayerProfile.find(Faker::Number.between(1, 15)))
    thr_forum.thr_comments = thr_forum.thr_comments + 1
  end
end

def seedAttachments
  # To do seeding of seedAttachments of comments of thread forums of sub forums
end

# Seeding with functions

seedSponsorsAndAds
seedLocations
seedPegi
seedGenres
seedPlatforms
seedGames
seedPlayerProfilesAndPlayerGameProfiles
seedSubForum
seedMailBoxes
seedPlayerFriends
seedPlayerBlokedList
#seedRatings
seedThreadForum
