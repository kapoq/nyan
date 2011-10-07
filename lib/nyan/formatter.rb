require 'rspec/core/formatters/base_formatter'
require 'nyan'

module Nyan
  class Formatter < RSpec::Core::Formatters::BaseFormatter
    def initialize(*args)
      super
      @nyan_flight = Nyan::Flight.new
    end
    
    def example_passed(_)
      @nyan_flight.next!
    end
  end
end
