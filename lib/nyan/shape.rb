module Nyan
  module Shape
    attr_accessor :top, :bottom, :left, :right

    def outside?(other_shape)
      (right < other_shape.left)   or
        (top > other_shape.bottom) or
        (left > other_shape.right) or
        (bottom < other_shape.top)
    end

    def inside?(other_shape)
      !outside(other_shape)
    end
  end
end
