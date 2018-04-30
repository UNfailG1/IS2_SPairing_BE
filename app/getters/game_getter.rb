require "net/http"
require "uri"
class GameGetter

  #Creating a new game from rawGame type
  #param id is the id of IGDB query
  def self.createGame(id)
    rawGame = getJsonIGDBGame(id)

    genres = rawGame["genres"]
    platforms = rawGame["platforms"]

    game = Game.create(id: rawGame["id"], gam_name: rawGame["name"],
      gam_description: rawGame["summary"], pegi_id: rawGame["pegi"]["rating"],
      gam_link: rawGame["website"], gam_image: rawGame["cover"]["url"])

    platforms.each{ |platform|
      puts platform
      if !Platform.exists?(platform)
        PlatformGetter.createPlatform(platform)
      end
      game.platforms << Platform.find(platform)
    }

    genres.each{ |genre|
      if !Genre.exists?(genre)
        GenreGetter.createGenre(genre)
      end
      game.genres << Genre.find(genre)
    }
    game
  end

  private

  #Get a raw game from the IGDB database using the user-key og the environment
  #param id is the id of the getting game
  def self.getJsonIGDBGame(id)
    uri = URI.parse('https://api-endpoint.igdb.com/games/' + id.to_s)   #Standard url of the getting game
    http = Net::HTTP.new(uri.host, 80)                                  #Creating http standard

    request = Net::HTTP::Get.new(uri.request_uri)                       #Creating http request
    request['user-key'] = ConstantGetter.IGDBKey                        #Setting user-key key
    request['Accept'] = 'application/json'                              #Setting data type to accept
    response = http.request(request)                                    #Performing request

    rawGame = JSON.parse(response.body)[0]                              #Parsing JSON response

    if rawGame == nil                                                   #If nil, raising record not found except
      return Game.find(id)
    end

    if rawGame["websites"] == nil                                       #If no website found, setting default website
      rawGame["website"] = rawGame["url"]
    else                                                                #Othterwise, getting highest category website
      cat = 10e+30
      rawGame["websites"].each{ |website|
        if website["category"] <= cat
          rawGame["website"] = website["url"]
        end
      }
    end
    if rawGame["summary"] == nil                                        #Informing about no description
      rawGame["summary"] = "No description. :c"
    end

    if rawGame["pegi"] == nil                                           #Setting pegi unknown
      rawGame["pegi"] = {}
      rawGame["pegi"]["rating"] = 6
    end

    if rawGame["cover"] == nil                                          #Setting no cover
      rawGame["cover"] = {}
      rawGame["cover"]["url"] = "//images.igdb.com/igdb/image/upload/t_cover_big/nocover_qhhlj6.jpg"
    end
    #Returns rawGame
    rawGame
  end

end
