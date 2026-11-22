require "gosu"
require_relative "../config"

class MenuState

  INPUT_DELAY = 10

  def initialize(window)

    @window = window

    @title_font = Gosu::Font.new(64)
    @menu_font = Gosu::Font.new(32)

    @options = [
      "Jogar",
      "Controles",
      "Sair"
    ]

    @selected = 0

    @cooldown = 0

  end

  def update

    if @cooldown > 0
      @cooldown -= 1
      return
    end

    if @window.button_down?(Gosu::KB_UP)

      @selected -= 1

      @selected = @options.size - 1 if @selected < 0

      @cooldown = INPUT_DELAY

    elsif @window.button_down?(Gosu::KB_DOWN)

      @selected += 1

      @selected = 0 if @selected >= @options.size

      @cooldown = INPUT_DELAY

    elsif @window.button_down?(Gosu::KB_RETURN)

      execute_option

      @cooldown = INPUT_DELAY

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
      "SNAKE 2D",
      @title_font,
      80,
      Gosu::Color::GREEN
    )

    @options.each_with_index do |option,index|

      color =
        index == @selected ?
        Gosu::Color::YELLOW :
        Gosu::Color::WHITE

      prefix =
        index == @selected ?
        "▶ " :
        "  "

      draw_centered_text(
        prefix + option,
        @menu_font,
        250 + index * 55,
        color
      )

    end

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

  def execute_option

    case @selected

    when 0
      @window.start_game

    when 1
      puts "Tela de controles"

    when 2
      @window.close

    end

  end

end