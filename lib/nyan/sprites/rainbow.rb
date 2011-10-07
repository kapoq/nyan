module Nyan
  module Rainbow
    BAND_HEIGHT = 3
    BEND_LENGTH = 18
    SECTIONS    = 5

    COLOURS = %w(1 2 3 4 5)
    BLANK   = ([Nyan::SPACE] * BEND_LENGTH).join

    FRAME_HEIGHT = COLOURS.length * BAND_HEIGHT + 1
    FRAME_WIDTH  = SECTIONS * BEND_LENGTH

    TOTAL_LENGTH = SECTIONS * BEND_LENGTH
    TOTAL_HEIGHT = BAND_HEIGHT * COLOURS.length

    SLICE = COLOURS.each_with_object([]) do |colour, slice|
      BAND_HEIGHT.times do
        slice << "#{colour}" * BEND_LENGTH
      end
    end    

    def self.frame(is_peak = true)
      frame_rows = Array.new(FRAME_HEIGHT + 1) { String.new }
      
      SECTIONS.times do
        this_slice = SLICE.dup
        FRAME_HEIGHT.times do |i|
          this_row = if (is_peak && i == FRAME_HEIGHT - 1) or (!is_peak && i == 0)
                       BLANK
                     else
                       this_slice.shift
                     end
          frame_rows[i] << this_row
        end
        is_peak = !is_peak
      end

      frame_rows.join(NEWLINE)
    end
    
    def self.to_frames
      @frames ||= [frame(true), frame(false)]
    end
  end
end
