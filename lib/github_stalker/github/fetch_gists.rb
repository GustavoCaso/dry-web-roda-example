require "github_stalker/import"

module GithubStalker
  module Github
    class FetchGists
      include GithubStalker::Import['github.client']

      def call(input)
        response = client.gists(input)
        response.each_with_object([]) do |gist, arr|
          hash = {}
          hash[:description] = gist["description"]
          hash[:html_url] = gist["html_url"]
          hash[:files] = []
          gist["files"].each do |filename, file_data|
            file_hash = {}
            file_hash[:name] = filename
            file_hash[:language] = file_data["language"]
            file_hash[:raw_url] = file_data["raw_url"]
            hash[:files] << file_hash
          end
          arr << hash
          arr
        end
      end
    end
  end
end
