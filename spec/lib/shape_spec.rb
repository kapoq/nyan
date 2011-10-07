require 'spec_helper'

class SimpleShape
  include ::Nyan::Shape

  def initialize
    @top, @bottom, @left, @right = [0, 0, 0, 0]    
  end
end

describe Nyan::Shape do
  let(:shape) { SimpleShape.new }
  
  describe "#outside?" do
    let(:other_shape) { SimpleShape.new }

    it "is outside when its right edge is beyond the left edge of the other shape" do
      shape.right = other_shape.left - 1
      shape.should be_outside(other_shape)
    end
    
    it "is outside when its left edge is beyond the right edge of the other shape" do
      shape.left = other_shape.right + 1
      shape.should be_outside(other_shape)
    end
    
    it "is outside when its top edge is below the bottom edge of the other shape" do
      shape.top = other_shape.bottom + 1
      shape.should be_outside(other_shape)
    end
    
    it "is outside when its bottom edge is above the top edge of the other shape" do
      shape.bottom = other_shape.top - 1
      shape.should be_outside(other_shape)
    end

    it "is not outside when its edges are all within the edges of the other shape" do
      shape.should_not be_outside(other_shape)
    end
  end
end
