require "gosu"

require_relative "config"
require_relative "graphics/assets"

class Board

  def initialize

    @background = Assets.image(
      "assets/images/backgrounds/grass.png"
    )

    @border = Assets.image(
      "assets/images/tiles/border.png"
    )

    @logo = Assets.image(
      "assets/images/ui/logo.png"
    )

  end

  def draw

    draw_background

    draw_play_area

    draw_logo

    draw_border

  end

  private

  # ==================================================
  # FUNDO EXTERNO
  # ==================================================

  def draw_background

    scale_x =
      Config::WINDOW_WIDTH.to_f / @background.width

    scale_y =
      Config::WINDOW_HEIGHT.to_f / @background.height

    @background.draw(
      0,
      0,
      0,
      scale_x,
      scale_y
    )

  end

  # ==================================================
  # ÁREA DO JOGO
  # ==================================================

  def draw_play_area

    width =
      Config::COLS * Config::CELL_SIZE

    height =
      Config::ROWS * Config::CELL_SIZE

    Gosu.draw_rect(
      Config::OFFSET_X,
      Config::OFFSET_Y,
      width,
      height,
      Gosu::Color::BLACK,
      1
    )

  end

  # ==================================================
  # LOGO NO FUNDO
  # ==================================================

  def draw_logo

    board_width =
      Config::COLS * Config::CELL_SIZE

    board_height =
      Config::ROWS * Config::CELL_SIZE

    # A logo ocupa aproximadamente 45% da área
    # do tabuleiro.

    target_width =
      board_width * 0.45

    target_height =
      board_height * 0.45

    scale_x =
      target_width / @logo.width.to_f

    scale_y =
      target_height / @logo.height.to_f

    scale = [scale_x, scale_y].min

    logo_width =
      @logo.width * scale

    logo_height =
      @logo.height * scale

    x =
      Config::OFFSET_X +
      (board_width - logo_width) / 2

    y =
      Config::OFFSET_Y +
      (board_height - logo_height) / 2

    # Transparência para não atrapalhar
    # a visualização da cobra.

    @logo.draw(
      x,
      y,
      1,
      scale,
      scale,
      Gosu::Color.rgba(
        255,
        255,
        255,
        45
      )
    )

  end

  # ==================================================
  # BORDA
  # ==================================================

  def draw_border

    board_width =
      Config::COLS * Config::CELL_SIZE

    board_height =
      Config::ROWS * Config::CELL_SIZE

    # -----------------------------------------------
    # TOPO
    # -----------------------------------------------

    x = Config::OFFSET_X

    while x < Config::OFFSET_X + board_width

      @border.draw(
        x,
        Config::OFFSET_Y,
        2
      )

      x += Config::CELL_SIZE

    end

    # -----------------------------------------------
    # BASE
    # -----------------------------------------------

    x = Config::OFFSET_X

    while x < Config::OFFSET_X + board_width

      @border.draw(
        x,
        Config::OFFSET_Y + board_height - Config::CELL_SIZE,
        2
      )

      x += Config::CELL_SIZE

    end

    # -----------------------------------------------
    # ESQUERDA
    # -----------------------------------------------

    y = Config::OFFSET_Y + Config::CELL_SIZE

    while y < Config::OFFSET_Y + board_height - Config::CELL_SIZE

      @border.draw(
        Config::OFFSET_X,
        y,
        2
      )

      y += Config::CELL_SIZE

    end

    # -----------------------------------------------
    # DIREITA
    # -----------------------------------------------

    y = Config::OFFSET_Y + Config::CELL_SIZE

    while y < Config::OFFSET_Y + board_height - Config::CELL_SIZE

      @border.draw(
        Config::OFFSET_X + board_width - Config::CELL_SIZE,
        y,
        2
      )

      y += Config::CELL_SIZE

    end

  end

end