require 'ansi'
include ANSI::Code

module Nyan
  module Colour
    TWINKLY = "X"
    
    MAP = {
      "#" => "#{bright}#{black}",
      "b" => "#{dark}#{black}",
      "R" => "#{bright}#{magenta}",
      "p" => "#{dark}#{magenta}",
      "`" => "#{dark}#{yellow}",
      "o" => "#{bright}#{white}",
      "_" => "#{bright}#{white}",
      "." => "#{dark}#{white}",
      "1" => "#{bright}#{red}",
      "2" => "#{bright}#{yellow}",
      "3" => "#{bright}#{green}",
      "4" => "#{bright}#{blue}",
      "5" => "#{bright}#{magenta}",
    }

    def self.twinkly?(char)
      TWINKLY == char
    end
    
    def self.colourize(char)
      escape_codes = if twinkly?(char)
                       rand > 0.5 ? "#{bright}#{white}" : "#{bright}#{black}"
                     else
                       MAP.fetch(char, "")
                     end
      "#{escape_codes}#{BLOCK}"
    end
  end
end
