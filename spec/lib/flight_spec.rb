require 'spec_helper'

describe Nyan::Flight do
  describe "#next!" do
    let(:stage) { Nyan::Stage.new }

    before do
      Nyan::Stage.stub(:new => stage)
    end
    
    it "plays the stage" do
      flight = Nyan::Flight.new
      flight.stub(:maybe_add_a_twinkly_star)
      stage.should_receive(:play!)
      flight.next!
    end
  end
end
