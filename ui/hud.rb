require "gosu"

class Hud

  def initialize

    @font = Gosu::Font.new(28)

  end

  def draw(score)

    @font.draw_text(
      "🐍 Snake 2D",
      100,
      10,
      10
    )

    @font.draw_text(
      "Pontos: #{score}",
      520,
      10,
      10
    )

  end

end