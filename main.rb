require_relative "config"

Dir.chdir(Config::ROOT_PATH)

require_relative "game"

Game.new.show