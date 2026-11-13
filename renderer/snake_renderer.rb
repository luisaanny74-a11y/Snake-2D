require "gosu"

require_relative "../config"

class SnakeRenderer

  BODY_COLOR = Gosu::Color.new(0xff006400)
  HEAD_COLOR = Gosu::Color.new(0xff00a000)

  def draw(snake)

    snake.each_segment do |segment, index|

      x = Config::OFFSET_X + segment[0] * Config::CELL_SIZE
      y = Config::OFFSET_Y + segment[1] * Config::CELL_SIZE

      if index == 0
        draw_head(x, y)
      else
        draw_body(x, y)
      end

    end

  end

  private

  def draw_head(x, y)

    Gosu.draw_rect(
      x,
      y,
      Config::CELL_SIZE,
      Config::CELL_SIZE,
      HEAD_COLOR,
      3
    )

  end

  def draw_body(x, y)

    Gosu.draw_rect(
      x,
      y,
      Config::CELL_SIZE,
      Config::CELL_SIZE,
      BODY_COLOR,
      3
    )

  end

end