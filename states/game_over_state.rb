require "gosu"
require_relative "../services/high_score"

class GameOverState

 def initialize(window, score)

  @window = window
  @score = score

  HighScore.save(score)

  @highscore = HighScore.load

  @title_font = Gosu::Font.new(56)
  @font = Gosu::Font.new(28)

end

  def update

    if @window.button_down?(Gosu::KB_RETURN)

      @window.start_game

      sleep(0.2)

    end

    if @window.button_down?(Gosu::KB_ESCAPE)

      @window.close

    end

  end

  def draw

    Gosu.draw_rect(
      0,
      0,
      800,
      600,
      Gosu::Color.rgb(25,25,25),
      0
    )

    @title_font.draw_text(
      "GAME OVER",
      210,
      120,
      10,
      1,
      1,
      Gosu::Color::RED
    )

    @font.draw_text(
      "Pontuação: #{@score}",
      280,
      240,
      10
    )

    @font.draw_text(
  "Recorde: #{@highscore}",
  285,
  285,
  10
)

    @font.draw_text(
      "ENTER - Jogar novamente",
      210,
      360,
      10
    )

    @font.draw_text(
      "ESC - Sair",
      295,
      410,
      10
    )

  end

end