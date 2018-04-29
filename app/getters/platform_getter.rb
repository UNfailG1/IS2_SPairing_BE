require "net/http"
require "uri"
class PlatformGetter

  def self.createPlatform(id)

    rawPlatform = getJsonIGDBPlatform(id)

    if rawPlatform["website"] == nil
      rawPlatform["website"] = rawPlatform["url"]
    end

    Platform.create(id: rawPlatform["id"], plat_name: rawPlatform["name"], plat_link: rawPlatform["website"])
  end

  private

  def self.getJsonIGDBPlatform(id)
    uri = URI.parse('https://api-endpoint.igdb.com/platforms/' + id.to_s)
    http = Net::HTTP.new(uri.host, 80)

    request = Net::HTTP::Get.new(uri.request_uri)
    request['user-key'] = ConstantGetter.IGDBKey
    request['Accept'] = 'application/json'
    response = http.request(request)

    JSON.parse(response.body)[0]
  end

end
