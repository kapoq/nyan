# -*- coding: utf-8 -*-
module Nyan
  class Sprite
    include Shape
    
    attr_accessor :x, :y, :z, :frames, :frame_index
    attr_reader   :blk

    def initialize(options = {}, &blk)
      @options = options
      self.x = @options.fetch(:x, 0)
      self.y = @options.fetch(:y, 0)
      self.z = @options.fetch(:z, 0)
      self.frames      = @options.fetch(:frames, [])
      self.frame_index = @options.fetch(:frame_index, 0)
      @blk = blk || @options[:animation]
    end

    def frame
      frames[frame_index]
    end

    def lines
      frame.lines    
    end

    def animate!
      self.frame_index = (self.frame_index + 1) % frames.length
      self.instance_eval(&blk) if blk
    end

    def height
      @height ||= frame.lines.count
    end

    def width
      @width ||= frame.lines.map { |l| l.chomp.unansi.length }.max
    end

    def top
      y
    end

    def bottom
      y + height
    end

    def left
      x
    end

    def right
      x + width
    end

    def <=>(other)
      z <=> other.z
    end
  end
end
