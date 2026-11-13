require "gosu"

module Sprites

  class << self

    attr_reader :apple
    attr_reader :grass
    attr_reader :hud
    attr_reader :button
    attr_reader :logo
    attr_reader :background

    def load(window)

      load_food
      load_ui
      load_background

    end

    private

    # ==================================================
    # COMIDA
    # ==================================================

    def load_food

      @apple = Gosu::Image.new(
        "assets/images/food/apple.png",
        retro: true
      )

    end

    # ==================================================
    # INTERFACE
    # ==================================================

    def load_ui

      @hud = Gosu::Image.new(
        "assets/images/ui/hud.png",
        retro: true
      )

      @button = Gosu::Image.new(
        "assets/images/ui/button.png",
        retro: true
      )

      @logo = Gosu::Image.new(
        "assets/images/ui/logo.png",
        retro: true
      )

    end

    # ==================================================
    # BACKGROUND
    # ==================================================

    def load_background

      @grass = Gosu::Image.new(
        "assets/images/backgrounds/grass.png",
        retro: true
      )

      @background = @grass

    end

  end

end