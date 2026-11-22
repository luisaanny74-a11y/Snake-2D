require "gosu"
require_relative "../config"

module Sprites
  class << self
    attr_reader :apple

    def load(_window)
      load_food
    end

    private

    def load_food
      @apple = Gosu::Image.new(
        Config.asset_path("assets/images/food/apple.png"),
        retro: true
      )
    end
  end
end