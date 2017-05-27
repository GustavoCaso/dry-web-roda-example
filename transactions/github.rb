require "github_stalker/transactions"
require "github_stalker/errors"

GithubStalker::Transactions.define do |t|
  t.define "transactions.fetch_github_info" do
    step :validate, with: "users.validate_input"
    try :fetch_info, with: "github.fetch_info", catch: GithubStalker::Errors::Invalidrequest
  end

  t.define "transactions.fetch_gists_info" do
    step :validate, with: "users.validate_input"
    try :fetch_info, with: "github.fetch_gists", catch: GithubStalker::Errors::Invalidrequest
  end
end
