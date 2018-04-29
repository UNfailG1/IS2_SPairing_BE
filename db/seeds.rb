require 'faker'


@nameSeed     = ""
@added        = ""
@flagTracker  = true
def trackerTime()
  if @flagTracker
    print("== SeedingDB: " + @nameSeed + " seeding\n")    # Information about what will be performe
    @start        = Time.now
    @flagTracker  = false
  else
    print("\t-- Added " + @added + "\n")
    print("\t-> " + (Time.now - @start).to_s +  "s\n")
    print("== SeedingDB: " + @nameSeed + " seeded\n\n")
    @flagTracker  = true
  end
end

def seedSponsorsAndAds
  @nameSeed = "Sponsor and Ads"
  @added    = "10 sponsors and 45 ads"
  trackerTime()

  Sponsor.create(spo_name:  "Google")
  Ad.create(ad_description: "Andoid",               ad_link: "https://www.android.com",               sponsor_id: 1)
  Ad.create(ad_description: "Google Maps",          ad_link: "https://www.google.com/maps",           sponsor_id: 1)
  Ad.create(ad_description: "Youtube",              ad_link: "https://www.youtube.com",               sponsor_id:1)
  Ad.create(ad_description: "Google Drive",         ad_link: "https://www.google.com/drive/",         sponsor_id: 1)

  Sponsor.create(spo_name:  "Microsoft")
  Ad.create(ad_description: "Windows",              ad_link: "https://www.microsoft.com",             sponsor_id: 2)
  Ad.create(ad_description: "Age of Empires",       ad_link: "https://www.ageofempires.com",          sponsor_id: 2)
  Ad.create(ad_description: "Halo",                 ad_link: "https://www.halowaypoint.com",          sponsor_id: 2)
  Ad.create(ad_description: "Office suite",         ad_link: "https://www.office.com",                sponsor_id: 2)

  Sponsor.create(spo_name:  "Blizzard")
  Ad.create(ad_description: "World of Warcraft",    ad_link: "https://worldofwarcraft.com",           sponsor_id: 3)
  Ad.create(ad_description: "Overwatch",            ad_link: "https://playoverwatch.com",             sponsor_id: 3)
  Ad.create(ad_description: "Heroes of the Dorm",   ad_link: "https://heroesofthedorm.com",           sponsor_id: 3)
  Ad.create(ad_description: "Hearth Stone",         ad_link: "https://playhearthstone.com/en-us/",    sponsor_id: 3)

  Sponsor.create(spo_name:  "Hi-Rez Studios")
  Ad.create(ad_description: "Smite",                ad_link: "https://www.smitegame.com",             sponsor_id: 4)
  Ad.create(ad_description: "Paladins",             ad_link: "https://www.paladins.com",              sponsor_id: 4)
  Ad.create(ad_description: "Hand of the Gods",     ad_link: "https://www.handofthegods.com",         sponsor_id: 4)

  Sponsor.create(spo_name:  "Riot Games")
  Ad.create(ad_description: "League of Legenfs",    ad_link: "https://na.leagueoflegends.com",        sponsor_id: 5)

  Sponsor.create(spo_name:  "Nintendo")
  Ad.create(ad_description: "Nintendo Switch",      ad_link: "https://www.nintendo.com/switch/",      sponsor_id: 6)
  Ad.create(ad_description: "Nintendo 3DS",         ad_link: "https://www.nintendo.com/3ds/",         sponsor_id: 6)
  Ad.create(ad_description: "Nintendo 2DS",         ad_link: "https://www.nintendo.com/2ds/",         sponsor_id: 6)
  Ad.create(ad_description: "Amiibo Detective Pikachu",
    ad_link: "https://www.nintendo.com/amiibo/detail/detective-pikachu-amiibo",   sponsor_id: 6)
  Ad.create(ad_description: "Amiibo Mipha",
    ad_link: "https://www.nintendo.com/amiibo/detail/mipha-amiibo-the-legend-of-zelda-series",        sponsor_id: 6)
  Ad.create(ad_description: "Amiibo Urbosa",
    ad_link: "https://www.nintendo.com/amiibo/detail/urbosa-amiibo-the-legend-of-zelda-series",       sponsor_id: 6)
  Ad.create(ad_description: "Amiibo daruk",
    ad_link: "https://www.nintendo.com/amiibo/detail/daruk-amiibo-the-legend-of-zelda-series",        sponsor_id: 6)
  Ad.create(ad_description: "Kirby Star Allies",
    ad_link: "https://www.nintendo.com/games/detail/kirby-star-allies-switch",                        sponsor_id: 6)
  Ad.create(ad_description: "Bayonetta 2",
    ad_link: "https://www.nintendo.com/games/detail/bayonetta-2-switch",                              sponsor_id: 6)

  Sponsor.create(spo_name:  "Sony")
  Ad.create(ad_description: "God of War",           ad_link: "https://godofwar.playstation.com",      sponsor_id: 7)
  Ad.create(ad_description: "Playstation 4",
    ad_link: "https://www.playstation.com/en-us/explore/ps4/",                                        sponsor_id: 7)
  Ad.create(ad_description: "Playstation 4 Pro",
    ad_link: "https://www.playstation.com/en-us/explore/ps4-pro",                                     sponsor_id: 7)
  Ad.create(ad_description: "Playstation 4 Accessories",
    ad_link: "https://www.playstation.com/en-us/explore/accessories/",                                sponsor_id: 7)
  Ad.create(ad_description: "Playstation VR",
    ad_link: "https://www.playstation.com/en-us/explore/playstation-vr/",                             sponsor_id: 7)
  Ad.create(ad_description: "Uncharted",
    ad_link: "https://www.unchartedthegame.com/en-us/",                                               sponsor_id: 7)

  Sponsor.create(spo_name:  "Electronic Arts")
  Ad.create(ad_description: "Anthem",               ad_link: "https://www.ea.com/games/anthem",       sponsor_id: 8)
  Ad.create(ad_description: "A Way Out",            ad_link: "https://www.ea.com/games/a-way-out",    sponsor_id: 8)
  Ad.create(ad_description: "Fe",                   ad_link: "https://www.ea.com/games/fe",           sponsor_id: 8)
  Ad.create(ad_description: "UFC 3",                ad_link: "https://www.ea.com/games/ufc/ufc-3",    sponsor_id: 8)
  Ad.create(ad_description: "FIFA",                 ad_link: "https://www.easports.com/fifa",         sponsor_id: 8)
  Ad.create(ad_description: "Star Wars BattleFront II",
    ad_link: "https://www.ea.com/games/starwars/battlefront/battlefront-2",                           sponsor_id: 8)
  Ad.create(ad_description: "Need for Speed Payback",
    ad_link: "https://www.ea.com/games/need-for-speed/need-for-speed-payback",                        sponsor_id: 8)

  Sponsor.create(spo_name:  "Rockstar Games")
  Ad.create(ad_description: "Bully",
    ad_link: "https://www.rockstargames.com/games/info/bully",                                        sponsor_id: 9)
  Ad.create(ad_description: "Grand Theft Auto V",
    ad_link: "https://www.rockstargames.com/games/info/V",                                            sponsor_id: 9)
  Ad.create(ad_description: "Red Dead Redemption 2",
    ad_link: "https://www.rockstargames.com/games/info/reddeadredemption2",                           sponsor_id: 9)

  Sponsor.create(spo_name:  "Ubisoft")
  Ad.create(ad_description: "Assassin's Creed",     ad_link: "https://assassinscreed.ubisoft.com",    sponsor_id: 10)
  Ad.create(ad_description: "For Honor",            ad_link: "https://forhonor.ubisoft.com",          sponsor_id: 10)
  Ad.create(ad_description: "Farcry 5",             ad_link: "https://far-cry.ubisoft.com",           sponsor_id: 10)
  Ad.create(ad_description: "Farcry Primal",
    ad_link: "https://www.ubisoft.com/es-mx/game/far-cry-primal/",                                    sponsor_id: 10)

  trackerTime()
end

def seedLocations
  @nameSeed = "Locations"
  @added    = "15 Locations"
  trackerTime()

  for i in 1..15 do
    Location.create(loc_lat: Faker::Address.latitude, loc_long: Faker::Address.longitude, loc_name: Faker::Address.community)
  end

  trackerTime()
end

def seedPegi
  @nameSeed = "Pegi"
  @added    = "5 Pegis"
  trackerTime

  Pegi.create(peg_name: '3 or older',   peg_age: 3,   peg_image: 'https://upload.wikimedia.org/wikipedia/commons/2/2c/PEGI_3.svg')
  Pegi.create(peg_name: '7 or older',   peg_age: 7,   peg_image: 'https://upload.wikimedia.org/wikipedia/commons/2/29/PEGI_7.svg')
  Pegi.create(peg_name: '12 or older',  peg_age: 12,  peg_image: 'https://upload.wikimedia.org/wikipedia/commons/4/44/PEGI_12.svg')
  Pegi.create(peg_name: '16 or older',  peg_age: 16,  peg_image: 'https://upload.wikimedia.org/wikipedia/commons/8/8a/PEGI_16.svg')
  Pegi.create(peg_name: '18 or older',  peg_age: 18,  peg_image: 'https://upload.wikimedia.org/wikipedia/commons/7/75/PEGI_18.svg')

  trackerTime
end

def seedGenres
  @nameSeed = "Genres"
  @added    = "65 Genres"
  trackerTime()

  Genre.create(id: 5, gen_name: "Shooter")
  Genre.create(id: 11, gen_name: "Real Time Strategy (RTS)")
  Genre.create(id: 13, gen_name: "Simulator")
  Genre.create(id: 14, gen_name: "Sport")
  Genre.create(id: 15, gen_name: "Strategy")
  Genre.create(id: 31, gen_name: "Adventure")
  Genre.create(id: 32, gen_name: "Indie")

  trackerTime()
end

def seedPlatforms

  @nameSeed = "Platforms"
  @added    = "25 Platform"
  trackerTime

  Platform.create(id: 3, plat_name: 'Linux', plat_link: "http://www.linux.org")
  Platform.create(id: 6, plat_name: 'PC (Microsoft Windows)', plat_link: 'http://windows.microsoft.com/')
  Platform.create(id: 9, plat_name: 'PlayStation 3', plat_link: "http://us.playstation.com/ps3/")
  Platform.create(id: 12, plat_name: 'Xbox 360', plat_link: "http://www.xbox.com/en-US/xbox-360")
  Platform.create(id: 14, plat_name: 'Mac', plat_link: 'https://www.apple.com/osx/')
  Platform.create(id: 34, plat_name: 'Android', plat_link: "http://www.android.com/")
  Platform.create(id: 39, plat_name: 'iOS', plat_link: "https://www.igdb.com/platforms/ios")
  Platform.create(id: 41, plat_name: 'Wii U', plat_link: "http://www.nintendo.com/wiiu/")
  Platform.create(id: 45, plat_name: 'PlayStation Network', plat_link: "https://www.igdb.com/platforms/psn")
  Platform.create(id: 46, plat_name: 'PlayStation Vita', plat_link: "https://www.igdb.com/platforms/psvita")
  Platform.create(id: 48, plat_name: 'PlayStation 4', plat_link: "http://www.playstation.com/ps4/")
  Platform.create(id: 49, plat_name: 'Xbox One', plat_link: "http://www.xbox.com/en-US/xbox-one")
  Platform.create(id: 74, plat_name: 'Windows Phone', plat_link: "https://www.igdb.com/platforms/winphone")
  Platform.create(id: 130, plat_name: 'Nintendo Switch', plat_link: "http://www.nintendo.com/switch")

  trackerTime
end

def seedGames

  @nameSeed = "Games"
  @added    = "15 Games"
  trackerTime

  #Origin Games
  game = Game.create(id: 115, gam_name: "League of Legends", gam_description: "League of Legends is a fast-paced, competitive online game that blends the speed and intensity of an RTS with RPG elements. Two teams of powerful champions, each with a unique design and playstyle, battle head-to-head across multiple battlefields and game modes. With an ever-expanding roster of champions, frequent updates and a thriving tournament scene, League of Legends offers endless replayability for players of every skill level.",
      gam_link: "http://www.leagueoflegends.com", pegi_id: 3)
  game.genres << Genre.find(11)
  game.genres << Genre.find(15)
  game.platforms << Platform.find(6)
  game.platforms << Platform.find(14)

  game = Game.create(id: 121, gam_name: "Minecraft", gam_description: "Minecraft is an open world game that has no specific goals for the player to accomplish, allowing players a large amount of freedom in choosing how to play the game however, there is an achievement system. The gameplay by default is first person, but players have the option to play in third person mode. The core gameplay revolves around breaking and placing blocks. The game world is essentially composed of rough 3D objects—mainly cubes—that are arranged in a fixed grid pattern and represent different materials, such as dirt, stone, various ores, water, and tree trunks. While players can move freely across the world, objects and items can only be placed at fixed locations relative to the grid. Players can gather these material blocks and place them elsewhere, thus allowing for various constructions.",
    gam_link: "https://minecraft.net/", pegi_id: 2)
  game.genres << Genre.find(13)
  game.genres << Genre.find(31)
  game.genres << Genre.find(32)
  game.platforms << Platform.find(3)
  game.platforms << Platform.find(6)
  game.platforms << Platform.find(9)
  game.platforms << Platform.find(12)
  game.platforms << Platform.find(14)
  game.platforms << Platform.find(34)
  game.platforms << Platform.find(39)
  game.platforms << Platform.find(41)
  game.platforms << Platform.find(45)
  game.platforms << Platform.find(46)
  game.platforms << Platform.find(48)
  game.platforms << Platform.find(49)
  game.platforms << Platform.find(74)
  game.platforms << Platform.find(130)

  game = Game.create(id: 990, gam_name: "Halo: Reach", gam_description: "Experience the story before the events of Halo: Combat Evolved as you fight to defend the planet Reach from a harrowing Covenant invasion. In this first-person shooter you can customize your own Spartan with armor and accessories to experience both a pulse-pounding campaign and addictive multiplayer mode. Reach will fall, but it won't go down without a fight.",
    gam_link: "https://www.halowaypoint.com/en-us/games/halo-reach/xbox-360", pegi_id: 4)
  game.genres << Genre.find(5)
  game.platforms << Platform.find(12)

  game = Game.create(id: 1905, gam_name: "Fortnite", gam_description: "Fortnite is the living, action building game from the developer formerly known as Epic MegaGames. You and your friends will lead a group of Heroes to reclaim and rebuild a homeland that has been left empty by mysterious darkness only known as \"the Storm\". \n \nBand together online to build extravagant forts, find or build insane weapons and traps and protect your towns from the strange monsters that emerge during the Storm. In an action experience from the only company smart enough to attach chainsaws to guns, get out there to push back the Storm and save the world. And don't forget to loot all the things.",
    gam_link: "http://fortnitegame.com", pegi_id: 2)
  game.genres << Genre.find(5)
  game.genres << Genre.find(13)
  game.genres << Genre.find(14)
  game.genres << Genre.find(31)
  game.platforms << Platform.find(6)
  game.platforms << Platform.find(14)
  game.platforms << Platform.find(39)
  game.platforms << Platform.find(45)
  game.platforms << Platform.find(48)
  game.platforms << Platform.find(49)

  trackerTime
end

def seedPlayerProfilesAndPlayerGameProfiles

  @nameSeed = "Player profiles and Player game profiles"
  @added    = "15 player profiles"
  trackerTime

  games_array = [115, 121, 990, 1905]
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
    game = games_array[i%4]
    PlayerGameProfile.create(pgp_reputation: reputation, pgp_nickname: player_nickname, pgp_rate: p_game_rate, player_profile_id: player, game_id: game)
    print('   -> email: ' + email + ' password: ' + password + "\n")
  end

  trackerTime
end

def seedSubForum
  games_array = [115, 121, 990, 1905]
  for i in 1..15 do
    game = Game.find(games_array[i%4])
    SubForum.create(sf_name: Faker::Zelda.location + " " + Faker::Zelda.character,
      sf_description: Faker::LeagueOfLegends.quote, game: game)
  end
end

def seedMailBoxes

  @nameSeed = "MailBoxes"
  @added    = "50 Mailboxes"
  trackerTime

  for i in 1..50 do
    sender = Faker::Number.between(1, 15)
    recever = Faker::Number.between(1, 15)
    msg = Faker::Hipster.sentence(10)
    Mailbox.create(sender_id: sender, receiver_id: recever, mail_message: msg)
  end

  trackerTime
end

def seedPlayerFriends

  @nameSeed = "PlayerFriends"
  @added    = "50 Fake friends :'c"
  trackerTime

  for i in 1..50 do
    player_id = Faker::Number.between(1, 15)
    player = PlayerProfile.find(player_id)
    friend_id = Faker::Number.between(1, 15)
    friend = PlayerProfile.find(friend_id)
    player.friends.push(friend)
    friend.friends.push(player)
  end

  trackerTime
end

def seedPlayerBlokedList

  @nameSeed = "BlockedPlayers"
  @added    = "50 bad friends :'c"
  trackerTime

  for i in 1..50 do
    player = PlayerProfile.find(Faker::Number.between(1, 15))
    blocked = PlayerProfile.find(Faker::Number.between(1, 15))
    player.blocked_players.push(blocked)
  end

  trackerTime

end

def seedThreadForum

  @nameSeed = "ThreadForums"
  @added    = "15 ThreadForums"
  trackerTime

  15.times do
    ThreadForum.create(thr_name: Faker::Zelda.item, thr_views: 0, thr_comments: 0, sub_forum: SubForum.find(Faker::Number.between(1, 15)))
  end

  trackerTime
end

def seedComments

  @nameSeed = "Comments"
  @added    = "15 Comments"
  trackerTime

  15.times do
    Comment.create(com_comment: Faker::MostInterestingManInTheWorld.quote, thread_forum: ThreadForum.find(Faker::Number.between(1, 15)), player_profile: PlayerProfile.find(Faker::Number.between(1, 15)))
  end

  trackerTime
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
seedThreadForum
seedComments
