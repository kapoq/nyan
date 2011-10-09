module Nyan
  class Flight
    def initialize(options = {})
      @framerate = options.fetch(:framerate, 0.09)
            
      @stage    = Stage.new(options.fetch(:stage, {}))
      @rainbow  = Sprite.new(:x => 0, :y => 17, :z => 1, :frames => Nyan::Rainbow.to_frames)
      @cat_head = Sprite.new(:x        => Nyan::Rainbow::TOTAL_LENGTH - 2,
                            :y         => 17,
                            :z         => 100,
                            :frames    => Nyan::CatHead.to_frames,
                            :animation => Proc.new do
                              @initial_x ||= @x
                              @initial_y ||= @y
                              case offset = [@x == @initial_x && :initial || :offset, @y == @initial_y && :initial || :offset]
                              when [:initial, :initial] then @y -= 2
                              when [:initial, :offset]  then @x += 2
                              when [:offset, :offset]   then @y += 2
                              when [:offset, :initial]  then @x -= 2
                              end
                            end)
      @pop_tart = Sprite.new(:x => @cat_head.x - 20,
                            :y => @cat_head.y - 2,
                            :z => @cat_head.z - 1,
                            :frames => Nyan::PopTart.to_frames)

      @line = Sprite.new(:x => 0, :y => 0, :z => 10, :frames => %w(1111111111))
      @dot  = Sprite.new(:x => 5, :y => 0, :z => 11, :frames => %w(2))
      @stage.add_sprite(@line)
      @stage.add_sprite(@dot)
      
      @stage.add_sprite(@rainbow)
      @stage.add_sprite(@cat_head)
      @stage.add_sprite(@pop_tart)
      @tick_time = Time.now
    end

    def next!
      maybe_add_a_twinkly_star
      @stage.play!
      while Time.now - @tick_time < @framerate; end
      @tick_time = Time.now
    end

    private

    def maybe_add_a_twinkly_star
      if rand > 0.85
        speed = rand > 0.5 ? 2 : 5
        star = Sprite.new(:x           => @stage.width,
                          :y           => rand(@stage.height - 11),
                          :z           => 0,
                          :speed       => speed,
                          :frames      => Nyan::Star.to_frames,
                          :frame_index => rand(Nyan::Star.to_frames.length - 1),
                          :animation   => Proc.new { self.x -= @options[:speed] })
        @stage.add_sprite(star)
      end
    end
  end
end
