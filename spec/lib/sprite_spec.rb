require 'spec_helper'

describe Nyan::Sprite do
  let(:output) { StringIO.new }
  let(:sprite) { Nyan::Sprite.new }
  let(:frame1) { double(:frame1) }
  let(:frame2) { double(:frame2) }
  let(:frames) { [frame1, frame2] }

  describe "#initialize" do
    it "accepts optional x, y, and frames parameters and sets its instance variables to their values" do
      sprite = Nyan::Sprite.new(:x => 1, :y => 2, :z => 3, :frames => frames, :frame_index => 4)
      sprite.x.should == 1
      sprite.y.should == 2
      sprite.z.should == 3
      sprite.frame_index.should == 4
      sprite.frames.should == frames
    end

    describe "defaults" do
      it "x = 0" do
        sprite.x.should == 0
      end

      it "y = 0" do
        sprite.y.should == 0
      end
      
      it "z = 0" do
        sprite.z.should == 0
      end

      it "frames is an empty array" do
        sprite.frames.should == []
      end

      it "frame_index = 0" do
        sprite.frame_index.should == 0
      end
    end

    it "accepts an block which is executed each animation step" do
      sprite = Nyan::Sprite.new(:frames => frames) do
        self.x = 99
      end
      sprite.should_receive(:x=).with(99)
      sprite.animate!
    end

    it "accepts a Proc as an optional animation parameter which is executed each animation step" do
      sprite = Nyan::Sprite.new(:frames => frames, :animation => Proc.new { self.x = 99 })
      sprite.should_receive(:x=).with(99)
      sprite.animate!
    end

    it "has left at x" do
      sprite.x = 99
      sprite.left.should == 99
    end

    it "has right at x + width" do
      sprite.x = 99
      sprite.stub(:width => 99)
      sprite.right.should == 198
    end

    it "has top at y" do
      sprite.y = 77
      sprite.top.should == 77
    end

    it "has bottom at y + height" do
      sprite.y = 77
      sprite.stub(:height => 99)
      sprite.bottom.should == 176
    end
  end

  describe "frames" do
    before do
      sprite.frames = frames
    end

    describe "#frames" do
      it "returns array of frames" do
        sprite.frames.should eql frames
      end
    end

    describe "#frame" do
      it "returns the current frame" do
        sprite.frame.should eql frame1
      end
    end
    
    describe "#animate!" do
      it "sets current frame to the next frame, looping to the start when necessary" do
        sprite.frame_index = 1
        sprite.animate!
        sprite.frame.should eql frame1
      end
    end
  end

  it "has a height equal to the number of lines in the frame" do
    sprite.frames = ["1\n2\n3\n4"]
    sprite.height.should == 4
  end

  it "has a width equal to the number of characters in widest line of the frame excluding line breaks" do
    sprite.frames = ["1\n22\n333\n22\n22"]
    sprite.width.should == 3
  end

  describe "#<=>" do
    let(:a) { double("Sprite a") }
    let(:b) { double("Sprite b") }
    
    it "sorts by z" do
      a.should_receive(:<=>).with(b)
      a <=> b
    end
  end
end
