require "net/http"
require "uri"
class GameGetter

  def self.createGame(id)
    rawGame = getJsonIGDBGame(id)

    if rawGame == nil
      return Game.find(id)
    end

    genres = rawGame["genres"]
    platforms = rawGame["platforms"]

    if rawGame["website"] == nil
      rawGame["website"] = rawGame["url"]
    end
    if rawGame["summary"] == nil
      rawGame["summary"] = "No description. :c"
    end

    game = Game.create(id: rawGame["id"], gam_name: rawGame["name"],
      gam_description: rawGame["summary"], pegi_id: rawGame["pegi"]["rating"], gam_link: rawGame["website"])

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

  def self.getJsonIGDBGame(id)
    uri = URI.parse('https://api-endpoint.igdb.com/games/' + id.to_s)
    http = Net::HTTP.new(uri.host, 80)

    request = Net::HTTP::Get.new(uri.request_uri)
    request['user-key'] = ConstantGetter.IGDBKey
    request['Accept'] = 'application/json'
    response = http.request(request)

    JSON.parse(response.body)[0]
  end
end
