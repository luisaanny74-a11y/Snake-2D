require "gosu"

require_relative "config"

require_relative "states/menu_state"
require_relative "states/play_state"
require_relative "states/game_over_state"
require_relative "services/high_score"
require_relative "graphics/assets"
require_relative "graphics/sprites"

class Game < Gosu::Window

  def initialize

  super(
    Config::WINDOW_WIDTH,
    Config::WINDOW_HEIGHT
  )

  self.caption = Config::WINDOW_TITLE

  Sprites.load(self)

  @state = MenuState.new(self)

end

  def update
    @state.update
  end

  def draw
    @state.draw
  end

  def start_game
    @state = PlayState.new(self)
  end

  def game_over(score)
    @state = GameOverState.new(self, score)
  end

end