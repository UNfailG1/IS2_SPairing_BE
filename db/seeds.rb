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

  Genre.create(gen_name: 'Action')
  Genre.create(gen_name: 'Platform games')
  Genre.create(gen_name: 'Shooter games')
  Genre.create(gen_name: "Fighting games and beat 'em ups")
  Genre.create(gen_name: 'Stealth game')
  Genre.create(gen_name: 'Survival games')
  Genre.create(gen_name: 'Rhythm games')
  Genre.create(gen_name: 'Action-adventure')
  Genre.create(gen_name: 'Survival horror')
  Genre.create(gen_name: 'Metroidvania')
  Genre.create(gen_name: 'Adventure')
  Genre.create(gen_name: 'Text adventures')
  Genre.create(gen_name: 'Graphic adventures')
  Genre.create(gen_name: 'Visual novels')
  Genre.create(gen_name: 'Interactive movie')
  Genre.create(gen_name: 'Real-time 3D adventures')
  Genre.create(gen_name: 'Role-playing')
  Genre.create(gen_name: 'Action RPG')
  Genre.create(gen_name: 'MMORPG')
  Genre.create(gen_name: 'Roguelikes')
  Genre.create(gen_name: 'Tactical RPG')
  Genre.create(gen_name: 'Sandbox RPG')
  Genre.create(gen_name: 'First-person party-based RPG')
  Genre.create(gen_name: 'Cultural differences')
  Genre.create(gen_name: 'Choices')
  Genre.create(gen_name: 'Fantasy')
  Genre.create(gen_name: 'Simulation')
  Genre.create(gen_name: 'Construction and management simulation')
  Genre.create(gen_name: 'Life simulation')
  Genre.create(gen_name: 'Vehicle simulation')
  Genre.create(gen_name: 'Strategy')
  Genre.create(gen_name: '4X game')
  Genre.create(gen_name: 'Artillery game')
  Genre.create(gen_name: 'Real-time strategy (RTS)')
  Genre.create(gen_name: 'Real-time tactics (RTT)')
  Genre.create(gen_name: 'Multiplayer online battle arena (MOBA)')
  Genre.create(gen_name: 'Tower defense')
  Genre.create(gen_name: 'Turn-based strategy (TBS)')
  Genre.create(gen_name: 'Turn-based tactics (TBT)')
  Genre.create(gen_name: 'Wargame')
  Genre.create(gen_name: 'Grand strategy wargame')
  Genre.create(gen_name: 'Sports')
  Genre.create(gen_name: 'Racing')
  Genre.create(gen_name: 'Sports game')
  Genre.create(gen_name: 'Competitive')
  Genre.create(gen_name: 'Sports-based fighting')
  Genre.create(gen_name: 'Other notable genres')
  Genre.create(gen_name: 'MMO')
  Genre.create(gen_name: 'Casual game')
  Genre.create(gen_name: 'Party game')
  Genre.create(gen_name: 'Programming game')
  Genre.create(gen_name: 'Logic game')
  Genre.create(gen_name: 'Trivia game')
  Genre.create(gen_name: 'Board game / Card game')
  Genre.create(gen_name: 'Idle gaming')
  Genre.create(gen_name: 'Video game genres by purpose')
  Genre.create(gen_name: 'Advergame')
  Genre.create(gen_name: 'Art game')
  Genre.create(gen_name: 'Casual game')
  Genre.create(gen_name: 'Christian game')
  Genre.create(gen_name: 'Educational game')
  Genre.create(gen_name: 'Electronic sports')
  Genre.create(gen_name: 'Exergame')
  Genre.create(gen_name: 'Serious game')
  Genre.create(gen_name: 'Scientific studies')

  trackerTime()
end

def seedPlatforms

  @nameSeed = "Platforms"
  @added    = "25 Platform"
  trackerTime

  Platform.create(plat_name: 'Atari 7800', plat_link: 'http://www.atari.com')
  Platform.create(plat_name: 'Atari Jaguar', plat_link: 'http://www.atari.com')
  Platform.create(plat_name: 'Sega Mega Drive / Genesis', plat_link: 'http://www.sega.com')
  Platform.create(plat_name: 'Sega Saturn', plat_link: 'http://www.sega.com')
  Platform.create(plat_name: 'Sega DreamCast', plat_link: 'http://www.sega.com')
  Platform.create(plat_name: 'Microsoft Xbox', plat_link: 'http://www.microsoft.com')
  Platform.create(plat_name: 'Microsoft Xbox 360', plat_link: 'http://www.microsoft.com')
  Platform.create(plat_name: 'Microsoft Xbox One', plat_link: 'http://www.microsoft.com')
  Platform.create(plat_name: 'Sony PlayStation', plat_link: 'http://www.sony.com')
  Platform.create(plat_name: 'Sony PlayStation 2', plat_link: 'http://www.sony.com')
  Platform.create(plat_name: 'Sony PlayStation 3', plat_link: 'http://www.sony.com')
  Platform.create(plat_name: 'Sony PlayStation 4', plat_link: 'http://www.sony.com')
  Platform.create(plat_name: 'Sony PlayStation Vita', plat_link: 'http://www.sony.com')
  Platform.create(plat_name: 'Nintendo Nintendo Entretainmen System', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Super Nintendo Entretainmen System', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Nintendo 64', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Nintendo Wii', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Nintendo Wii U', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Nintendo Switch', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Nintendo Game Boy', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Nintendo Game Boy Color', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Nintendo Game Boy Micro', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Nintendo Game Boy Advance SP', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Nintendo Game Boy Advance', plat_link: 'http://www.nintendo.com')
  Platform.create(plat_name: 'Nintendo Nintendo 3DS', plat_link: 'http://www.nintendo.com')

  trackerTime
end

def seedGames

  @nameSeed = "Games"
  @added    = "15 Games"
  trackerTime

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
    new_game = Game.create(gam_name: title, gam_description: Faker::Lovecraft.paragraph, gam_link: Faker::Internet.url(title + '.com'), pegi_id: Faker::Number.between(1, 5))
    new_game.genres = new_genres
    new_game.platforms = new_platforms
  end

  trackerTime
end

def seedPlayerProfilesAndPlayerGameProfiles

  @nameSeed = "Player profiles and Player game profiles"
  @added    = "15 player profiles"
  trackerTime

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
    print('   -> email: ' + email + ' password: ' + password + "\n")
  end

  trackerTime
end

def seedSubForum
  15.times do
    game = Game.find(Faker::Number.between(1, 15))
    SubForum.create(sf_name: Faker::Zelda.location + " " + Faker::Zelda.character, sf_description: Faker::LeagueOfLegends.quote, game: game)
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
