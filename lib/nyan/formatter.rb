require 'rspec/core/formatters/base_text_formatter'
require 'nyan'

module Nyan
  class Formatter < RSpec::Core::Formatters::BaseTextFormatter
    def initialize(*args)
      super
      @nyan_flight = Nyan::Flight.new
      @still_passing = true
      print cls
      puts "Awaiting Nyan..."
    end
    
    def example_passed(_)
      @nyan_flight.next! if @still_passing
    end

    def example_failed(example)
      super
      @output.print cls
      @output.print move(0,0)
      @output.puts red("NO NYAN FOR YOU")
      @still_passing = false
    end

    def dump_failures
      return if failed_examples.empty?
      output.puts
      output.puts "Failures:"
      failed_examples.each_with_index do |example, index|
        output.puts
        dump_pending_example_fixed(example, index) || dump_failure(example, index)
        dump_backtrace(example)
      end
    end

    def dump_backtrace(example)
      format_backtrace(example.execution_result[:exception].backtrace, example).each do |backtrace_info|
        output.puts cyan("         # #{backtrace_info}")
      end
    end

  end
end
