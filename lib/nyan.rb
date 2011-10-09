require "nyan/version"

require "nyan/colour"
require "nyan/shape"
require "nyan/buffer"
require "nyan/sprite"
require "nyan/stage"

require "nyan/flight"

module Nyan
  BLOCK   = "\xE2\x96\x88"
  SPACE   = "\x20"
  NEWLINE = "\n"
  NOTHING = ""
  
  require "nyan/sprites/rainbow"
  require "nyan/sprites/cat_head"
  require "nyan/sprites/pop_tart"
  require "nyan/sprites/tail"
  require "nyan/sprites/star"
end
