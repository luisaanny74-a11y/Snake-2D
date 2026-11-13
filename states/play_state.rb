require "gosu"

require_relative "../board"
require_relative "../config"

require_relative "../entities/snake"
require_relative "../entities/food"

require_relative "../ui/hud"

require_relative "../graphics/sprites"

require_relative "../renderer/snake_renderer"

class PlayState

  def initialize(window)

    @window = window

    @board = Board.new

    @snake = Snake.new
    @food = Food.new

    @food.randomize(@snake.body)

    @hud = Hud.new

    @snake_renderer = SnakeRenderer.new

    @score = 0
    @timer = 0

  end

  #################################################
  # UPDATE
  #################################################

  def update

    handle_input

    @timer += 1

    return unless @timer >= Config::INITIAL_SPEED

    @timer = 0

    @snake.move

    if @snake.head == @food.position

      @score += 1

      @snake.grow

      @food.randomize(@snake.body)

    end

    check_collisions

  end

  #################################################
  # DRAW
  #################################################

  def draw

    @board.draw

    @food.draw

    @snake_renderer.draw(@snake)

    @hud.draw(@score)

  end

  private

  #################################################
  # INPUT
  #################################################

  def handle_input

    @snake.direction = :up if @window.button_down?(Gosu::KB_UP)

    @snake.direction = :down if @window.button_down?(Gosu::KB_DOWN)

    @snake.direction = :left if @window.button_down?(Gosu::KB_LEFT)

    @snake.direction = :right if @window.button_down?(Gosu::KB_RIGHT)

  end

  #################################################
  # COLISÕES
  #################################################

  def check_collisions

    x, y = @snake.head

    if x < 0 ||
       x >= Config::COLS ||
       y < 0 ||
       y >= Config::ROWS ||
       @snake.collided_with_self?

      @window.game_over(@score)

    end

  end

end