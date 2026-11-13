require_relative "../config"
require_relative "../graphics/sprites"

class Food

  attr_reader :position

  def initialize
    @position = [0, 0]
  end

  #################################################
  # Sprite
  #################################################

  def image
    Sprites.apple
  end

  #################################################
  # Nova posição
  #################################################

  def randomize(snake_body)

    begin

      @position = [
        rand(Config::COLS),
        rand(Config::ROWS)
      ]

    end while snake_body.include?(@position)

  end

  #################################################
  # Desenho
  #################################################

  def draw

    x = Config::OFFSET_X + @position[0] * Config::CELL_SIZE
    y = Config::OFFSET_Y + @position[1] * Config::CELL_SIZE

    image.draw(
      x,
      y,
      2
    )

  end

end