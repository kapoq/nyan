module Nyan
    module PopTart
    SHAPE =<<-EOF
     ooooooooooooooooooooooooooooo
    o22222222222222222222222222222o
   o222222ppppppppppppppppp22222222o
  o22222ppppppRRRpppppppppppppppp222o
  o22pppppppppRRRppppppppppppppppp22o
 o22pppppRRRppRRRpppppppRRpppppppp222o
 o222ppppRRRppppppppppppRppppppppp222o
 o222pppppppppppppppppppRpppppppppp22o
  o222ppppRRRppppppRRRppppppppppp222o
  o222ppppRRRppppppRRRppppppppppp2222o
 o22pppppppppppppppppppppppppppp22222o
 o22ppppppppRRRpppppppppppppppppp2222o
 o22ppppppppRRRppppppRRRppppppppp2222o
 o22ppppppppRRRppppppRRRppppppppp2222o
 o22pppppppppppppppppRRRpppppppppp222o
 o222pppppppppppppppppppppppppppp2222o
 o222222ppppppppppppppppp222222222222o
  ooooooooooooooooooooooooooooooooooo  
EOF

    def self.to_frames
      @fames ||= Array(SHAPE)
    end
  end
end
