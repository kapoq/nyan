require 'spec_helper'

describe Nyan::Colour do
  describe ".colourize" do
    it "looks up the char in the map" do
      Nyan::Colour::MAP.should_receive(:fetch).with("X", anything)
      Nyan::Colour.colourize("X")
    end
    
    it "returns the escape code for the colour followed by a block char" do
      Nyan::Colour::MAP.stub(:fetch => "__ESC__")
      Nyan::Colour.colourize("X").should eql "__ESC__#{Nyan::BLOCK}"
    end
  end
end
