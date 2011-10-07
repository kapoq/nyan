require "ansi"
include ANSI::Code

module Nyan
  module Colour    
    MAP = {
      "#" => "#{bright}#{black}",
      "b" => "#{dark}#{black}",
      "R" => "#{bright}#{magenta}",
      "p" => "#{dark}#{magenta}",
      "2" => "#{bright}#{yellow}",
      "`" => "#{dark}#{yellow}",
      "o" => "#{bright}#{white}",
      "_" => "#{bright}#{white}",
      "." => "#{dark}#{white}",
      "1" => "#{bright}#{red}",
      "3" => "#{bright}#{green}",
      "4" => "#{bright}#{blue}",
      "5" => "#{bright}#{magenta}"
    }

    def self.colourize(char)
      escape_codes = MAP.fetch(char, reset)
      "#{escape_codes}#{Nyan::BLOCK}"
    end
  end
end
