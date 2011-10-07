module Nyan
    module CatHead
    SHAPE =<<EOF
 #                     #
#.###               ###.#
#....##            ##...#
#__....############...__#
 ___...#..........#..___
 #__.................__#
 #.....................#
  #....o#.......o#....#
  #....##.......##....#
  #........b.b........#
  #.p.......b.......p.#
   #.p.b....b....b.p.#
   #...b....b....b...#
   #....bbbb.bbbb....#
    ###...........###
       ###########
EOF

    def self.to_frames
      @frames ||= Array(SHAPE)
    end
  end
end
