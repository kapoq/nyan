module Nyan
  class Stage
    include Shape

    SPACE   = "\x20"
    NOTHING = ""
    
    attr_reader :output, :height, :width
    
    def initialize(options = {})
      @output   = options.fetch(:output, $stdout)
      @height   = options.fetch(:height, ANSI::Terminal.terminal_height)
      @width    = options.fetch(:width, ANSI::Terminal.terminal_width)
      @coloured = options.fetch(:coloured, true)
      clear_buffer
    end
    
    def sprites
      @sprites ||= []
    end
    
    def add_sprite(sprite)
      self.sprites.push(sprite)
    end

    def remove_sprite(sprite)
      self.sprites.delete(sprite)
    end

    def play!
      render
      animate!
      clean!
    end

    def render
      clear_buffer
      sprites.sort.each { |s| write_to_buffer(s) }
      print_buffer
    end

    def animate!
      sprites.each { |s| s.animate! }
    end

    def clean!
      sprites.delete_if { |s| s.outside?(self) }
    end

    def top
      0
    end

    def bottom
      height - 1
    end

    def left
      0
    end

    def right
      width - 1
    end

    def coloured?
      @coloured
    end

    private

    def clear_buffer
      @buffer = Array.new(height) do
        Array.new(width) do
          { :char => SPACE, :ansi => SPACE }
        end
      end
    end
    
    def write_to_buffer(sprite)
      sprite.lines.each_with_index do |line, i|
        line_y = sprite.y + i
        if line_y.between?(top, bottom)
          line.chomp.chars.each_with_index do |char, j|
            char_x = sprite.x + j
            if char_x.between?(left, right) && char != Nyan::SPACE
              colourized_char = Colour.colourize(char)
              @buffer[line_y][char_x] = { :char => char, :colourized_char => colourized_char }
            end
          end
        end
      end
    end

    def print_buffer
      key = coloured? ? :colourized_char : :char
      output.print move(0, 0)
      @buffer.each do |row|
        output.print clear_line
        output.print reset
        output.print row.map { |h| h[key] }.join
        output.down
      end
    end
  end
end
