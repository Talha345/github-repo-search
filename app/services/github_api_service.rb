require "uri"
require "net/http"

class GithubApiService
  def self.search_repositories(search_term, page)
    url = URI("https://api.github.com/search/repositories?q=#{search_term}&page=#{page}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    if response.code == '200'
      JSON.parse(response.body)
    else
      []
    end
  end
end