require "gosu"
require_relative "../services/high_score"
require_relative "../config"

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
      Config::WINDOW_WIDTH,
      Config::WINDOW_HEIGHT,
      Gosu::Color.rgb(25,25,25),
      0
    )

    draw_centered_text(
      "GAME OVER",
      @title_font,
      120,
      Gosu::Color::RED
    )

    draw_centered_text(
      "Pontuação: #{@score}",
      @font,
      240
    )

    draw_centered_text(
      "Recorde: #{@highscore}",
      @font,
      285
    )

    draw_centered_text(
      "ENTER - Jogar novamente",
      @font,
      360
    )

    draw_centered_text(
      "ESC - Sair",
      @font,
      410
    )

  end

  private

  def draw_centered_text(text, font, y, color = Gosu::Color::WHITE)
    x = (Config::WINDOW_WIDTH - font.text_width(text)) / 2

    font.draw_text(
      text,
      x,
      y,
      10,
      1,
      1,
      color
    )
  end

end