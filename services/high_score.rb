require "fileutils"

class HighScore

  FILE_PATH = File.expand_path("../save/highscore.txt", __dir__)

  def self.load

    FileUtils.mkdir_p(File.dirname(FILE_PATH))

    unless File.exist?(FILE_PATH)
      File.write(FILE_PATH, "0")
    end

    File.read(FILE_PATH).to_i

  end

  def self.save(score)

    current = load

    return if score <= current

    File.write(FILE_PATH, score.to_s)

  end

end