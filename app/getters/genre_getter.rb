require "net/http"
require "uri"
class GenreGetter

  def self.createGenre(id)

    rawGenre = getJsonIGDBGenre(id)

    Genre.create(id: rawGenre["id"], gen_name: rawGenre["name"])
  end

  private

  def self.getJsonIGDBGenre(id)
    uri = URI.parse('https://api-endpoint.igdb.com/genres/' + id.to_s)
    http = Net::HTTP.new(uri.host, 80)

    request = Net::HTTP::Get.new(uri.request_uri)
    request['user-key'] = ConstantGetter.IGDBKey
    request['Accept'] = 'application/json'
    response = http.request(request)

    JSON.parse(response.body)[0]
  end

end
