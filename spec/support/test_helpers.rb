module TestHelpers
  module_function

  def app
    GithubStalker::Application.app
  end

  def rom
    GithubStalker::Container["persistence.rom"]
  end

  def db_connection
    rom.gateways[:default].connection
  end
end
