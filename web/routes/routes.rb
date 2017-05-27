# Define your routes like this:
#
class GithubStalker::Application
  route do |r|
    r.on "start" do
      r.get do
        r.view "start"
      end
    end

    r.get "gists/:username" do |username|
      r.resolve "transactions.fetch_gists_info" do |fetch_gists_info|
        fetch_gists_info.(username) do |result|
          result.success do |gists|
            r.view "gists", gists: gists
          end

          result.failure do |error|
            r.view "error", error: error
          end
        end
      end
    end

    r.post "search" do
      r.resolve "transactions.fetch_github_info" do |fetch_github_info|
        fetch_github_info.(r[:username]) do |result|
          result.success do |github_info|
            if github_info["message"] == "Not Found"
              flash[:alert] = "No information for this user"
              r.redirect "start"
            else
              r.view "result", info: github_info
            end
          end

          result.failure do |error|
            r.view "error", error: error
          end
        end
      end
    end
  end
end
