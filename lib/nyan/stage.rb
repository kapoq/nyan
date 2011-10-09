module Nyan
  class Stage
    include Shape
    
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
      sprites.sort.reverse.each { |s| write_to_buffer(s) }
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
      @buffer = Buffer.new(height, width, SPACE)
    end
    
    def write_to_buffer(sprite)
      sprite.lines.each_with_index do |row, i|
        @last_char_with_colour = nil
        y = sprite.y + i
        next unless y.between?(top, bottom)
        row.chomp.chars.each_with_index do |char, j|
          x = sprite.x + j
          next unless x.between?(left, right)
          if char_writeable?(char) && buffer_writeable_at_point?(x, y)
            @buffer[y][x] = coloured? && new_colour_or_continue(char) || char
          else
            @last_char_with_colour = nil
          end
        end
      end
    end

    def char_writeable?(char)
      SPACE != char
    end
      
    def buffer_writeable_at_point?(x, y)
      SPACE == @buffer[y][x]
    end

    def new_colour_or_continue(char)
      coloured_char = Colour.colourize(char)
      if coloured_char == @last_char_with_colour
        BLOCK
      else
        @last_char_with_colour = coloured_char
      end
    end

    def print_buffer
     output.print move(top, left)
     output.print @buffer.to_s
    end
  end
end
