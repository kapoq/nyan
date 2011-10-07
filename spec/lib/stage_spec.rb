require 'spec_helper'

describe Nyan::Stage do
  let(:output) { StringIO.new }
  let(:stage)  { Nyan::Stage.new(:output => output, :height => 5, :width => 5, :coloured => false) }
  let(:sprite) { mock(:sprite) }

  before do

  end
  
  describe "#initialize" do
    context "when output parameter is present" do
      it "sets output to the value of the output parameter" do
        stage = Nyan::Stage.new(:output => output)
        stage.output.should eql output
      end
    end

    context "defaults" do
      let(:default_stage) { Nyan::Stage.new }

      it "sets output to $stdout" do
        default_stage.output.should eql $stdout
      end

      it "is coloured" do
        default_stage.should be_coloured
      end

      it "has a height equal to the terminal height" do
        ::ANSI::Terminal.stub(:terminal_height => 99)
        default_stage.height.should == 99
      end

      it "has a width equal to the terminal width" do
        ::ANSI::Terminal.stub(:terminal_width => 99)
        default_stage.width.should == 99
      end
      
      it "has top at 0" do
        default_stage.top.should == 0
      end

      it "has left at 0" do
        default_stage.left.should == 0
      end

      it "has right at width - 1" do
        width = 99
        default_stage.stub :width => width
        default_stage.right.should == width - 1
      end

      it "has bottom at height - 1" do
        height = 99
        default_stage.stub :height => height
        default_stage.bottom.should == height - 1
      end
    end
  end
  
  describe "#add_sprite" do
    it "adds a sprite" do
      stage.add_sprite(sprite)
      stage.sprites.should include(sprite)
    end
  end

  describe "#remove_sprite" do
    it "removes a sprite" do
      sprite1 = double(:sprite1)
      sprite2 = double(:sprite2)
      stage.add_sprite(sprite1)
      stage.add_sprite(sprite2)
      stage.remove_sprite(sprite1)
      stage.sprites.should == [sprite2]
    end
  end

  describe "#play!" do
    it "renders, animates, and cleans" do
      stage.should_receive(:render)
      stage.should_receive(:animate!)
      stage.should_receive(:clean!)
      stage.play!
    end
  end
  
  describe "#render" do
    let(:sprites) { double("Sprites") }
    let(:sprite)  { Nyan::Sprite.new }
    
    before do
      stage.stub(:sprites => sprites)
      sprites.stub(:sort  => [sprite])
    end
      
    it "renders its sprites to its output in order of z-index" do
      sprites.should_receive(:sort).and_return([])
      stage.render
    end

    it "prints each sprite to the output" do
      sprite.frames = %w(XXXX)
      stage.render
      output.string.should =~ /XXXX/
    end

    it "only prints characters within the viewport" do
      stage.stub(:height => 1, :width => 1)
      sprite.x = -1
      sprite.y = -1
      sprite.frames = ["OOO\nOXO\nOOO"]
      stage.render
      output.string.should =~ /X/
      output.string.should_not =~ /O/
    end
    
    it "renders each sprite at its correct position" do
      sprite.x = stage.right
      sprite.y = stage.bottom
      sprite.frames = %w(X)
      stage.render
      output.string.should =~ /X$/
    end

    context "when coloured" do
      before do
        stage.stub(:coloured? => true)
      end
      
      it "prints coloured chars" do
        Nyan::Colour.stub(:colourize => "__COLOURED__")
        sprite.frames = %w(x)
        stage.render
        output.string.should =~ /__COLOURED__/
      end
    end
  end

  describe "#clean!" do
    before do
      stage.stub(:sprites => [sprite])
    end
    
    it "checks whether the sprite is outside the stage" do
      sprite.should_receive(:outside?).with(stage)
      stage.clean!
    end

    it "removes sprites outside the stage" do
      sprite.stub(:outside? => true)
      stage.clean!
      stage.sprites.should_not include(sprite)
    end
    
    it "does not remove sprites inside the stage" do
      sprite.stub(:outside? => false)
      stage.clean!
      stage.sprites.should include(sprite)
    end
  end

  describe "#animate!" do
    before do
      stage.add_sprite(sprite)
    end

    it "updates its sprites to their next frame" do
      sprite.should_receive(:animate!)
      stage.animate!
    end
  end
end
