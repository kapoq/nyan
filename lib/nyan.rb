require "nyan/version"

require "nyan/colour"
require "nyan/shape"
require "nyan/sprite"
require "nyan/stage"

require "nyan/flight"

module Nyan
  BLOCK   = "\u2588"
  SPACE   = "\x20"
  NEWLINE = "\n"
  
  require "nyan/sprites/rainbow"
  require "nyan/sprites/cat_head"
  require "nyan/sprites/pop_tart"
  require "nyan/sprites/tail"
  require "nyan/sprites/star"
end
