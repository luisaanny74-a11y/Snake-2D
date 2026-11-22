require "gosu"
require_relative "../config"

module Assets
  @images = {}

  class << self
    def image(path)
      absolute_path = Config.asset_path(path)
      @images[absolute_path] ||= Gosu::Image.new(absolute_path)
    end
  end
end