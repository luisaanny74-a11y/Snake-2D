class Snake

  attr_reader :body
  attr_reader :direction

  def initialize

    # Posição inicial da cobra
    @body = [
      [10, 4],
      [9, 4],
      [8, 4],
      [8, 5],
      [8, 6]
    ]

    @direction = :right
    @grow = false

  end

  def direction=(new_direction)

    return if @direction == :up && new_direction == :down
    return if @direction == :down && new_direction == :up
    return if @direction == :left && new_direction == :right
    return if @direction == :right && new_direction == :left

    @direction = new_direction

  end

  def move

    new_head = head.dup

    case @direction

    when :up
      new_head[1] -= 1

    when :down
      new_head[1] += 1

    when :left
      new_head[0] -= 1

    when :right
      new_head[0] += 1

    end

    @body.unshift(new_head)

    @body.pop unless @grow

    @grow = false

  end

  def grow
    @grow = true
  end

  def head
    @body.first
  end

  def tail
    @body.last
  end

  def collided_with_self?
    @body[1..].include?(head)
  end

  def segment(index)
    @body[index]
  end

  def previous_segment(index)

    return nil if index <= 0

    @body[index - 1]

  end

  def next_segment(index)

    return nil if index >= @body.size - 1

    @body[index + 1]

  end

  def each_segment

    @body.each_with_index do |segment, index|

      yield segment, index

    end

  end

  def length
    @body.length
  end

end