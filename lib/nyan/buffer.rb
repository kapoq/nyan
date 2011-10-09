module Nyan
  class Buffer < Array
    def initialize(height, width, default)
      @height  = height
      @width   = width
      @default = default
      super(height) do
        Array.new(width) do
          default
        end
      end
    end

    def to_s
      join
    end
  end
end
