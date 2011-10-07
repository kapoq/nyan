module Nyan
  module Star
    SHAPE_LIST =<<EOF
...........
...........
...........
...........
...........
.....X.....
...........
...........
...........
...........
...........
--
...........
...........
...........
...........
.....X.....
....X.X....
.....X.....
...........
...........
...........
...........
--
...........
...........
...........
.....X.....
.....X.....
...XX.XX...
.....X.....
.....X.....
...........
...........
...........
--
...........
.....X.....
.....X.....
.....X.....
...........
.XXX.X.XXX.
...........
.....X.....
.....X.....
.....X.....
...........
--
...........
....XXX....
...X...X...
.X.......X.
X.........X
X.........X
X.........X
.X.......X.
..X.....X..
....XXX....
...........
--
.....X.....
...........
...........
...........
...........
X.........X
...........
...........
...........
...........
.....X.....
EOF

    def self.to_frames
      @frames ||= SHAPE_LIST.gsub(/\./, SPACE).gsub(/X/, BLOCK).split(/--./m)
    end
  end
end
