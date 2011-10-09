#!/usr/bin/env ruby
require 'rubygems'
require 'bundler'

nyan_dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(nyan_dir) unless $LOAD_PATH.include?(nyan_dir)
require "nyan"

require 'benchmark'
require 'stringio'

s = StringIO.new
real_stdout = $stdout
$stdout     = s

colour_flight = Nyan::Flight.new(:framerate => 0, :stage => { :output => real_stdout })
bw_flight     = Nyan::Flight.new(:framerate => 0, :stage => { :output => real_stdout, :coloured => false })

COUNT = 50
Benchmark.bmbm do |b|
  b.report("Colour:") {
    COUNT.times { colour_flight.next! }
  }
  b.report("B&W:") {
    COUNT.times { bw_flight.next! }
  }
end

$stdout = real_stdout
print cls
puts s.string
