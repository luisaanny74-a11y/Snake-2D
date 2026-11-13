module Assets

  @images = {}

  class << self

    def image(path)

      return @images[path] if @images[path]

      @images[path] = Gosu::Image.new(path)

    end

  end

end