module Config
  ROOT_PATH = File.expand_path(__dir__)

  # Janela
  WINDOW_WIDTH = 1024
  WINDOW_HEIGHT = 768
  WINDOW_TITLE = "Snake 2D"

  # Tabuleiro
  CELL_SIZE = 32

  COLS = 24
  ROWS = 20

  OFFSET_X = 128
  OFFSET_Y = 64

  # Jogo
  INITIAL_SPEED = 8

  # FPS
  FPS = 60

  def self.asset_path(relative_path)
    File.join(ROOT_PATH, relative_path)
  end

end