require 'spec_helper'

describe Nyan::Colour do
  describe ".colourize" do
    context "when the char is not twinkly" do
      before do
        Nyan::Colour.stub(:twinkly? => false)
      end
      
      it "looks up the char in the map" do
        Nyan::Colour::MAP.should_receive(:fetch).with("X", anything)
        Nyan::Colour.colourize("X")
      end
      
      it "returns the escape code for the colour followed by a block char" do
        Nyan::Colour::MAP.stub(:fetch => "__ESC__")
        Nyan::Colour.colourize("X").should eql "__ESC__#{Nyan::BLOCK}"
      end
    end

    context "when the char is not twinkly" do
      before do
        Nyan::Colour.stub(:twinkly? => true)
      end

      it "does not look up the char in the map" do
        Nyan::Colour::MAP.should_not_receive(:fetch)
        Nyan::Colour.colourize("X")
      end

      it "returns a different escape code depending on the value of a random number" do
        Nyan::Colour.should_receive(:rand).and_return(0)
        r1 = Nyan::Colour.colourize("X")
        Nyan::Colour.should_receive(:rand).and_return(1)
        r2 = Nyan::Colour.colourize("X")
        r1.should_not eq r2
      end
    end
  end
end
