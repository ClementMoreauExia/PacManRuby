class Monsters
  attr_accessor :color, :x, :y
  def initialize(window,color,x,y)
    @window = window

    if(color == "red")
    @image = Gosu::Image.new(@window,"media/Red.png")
    end

    if(color == "blue")
    @image = Gosu::Image.new @window, "media/Blue.png"
    end

    if(color == "orange")
    @image = Gosu::Image.new @window, "media/Orange.png"
    end

    if(color == "pink")
    @image = Gosu::Image.new @window, "media/Pink.png"
    end

    @monsterx = x
    @monstery = y

    @right_rectangle = Rectangle.new(0, 0,5, @image.height-10)
    @left_rectangle = Rectangle.new(0, 0,5, @image.height-10)
    @up_rectangle = Rectangle.new(0, 0, @image.height-10, 5)
    @down_rectangle = Rectangle.new(0, 0, @image.height-10, 5)

  end

  def update(tiles)

    synchronize_rectangles()
    tiles.each do |tile|
      next if tile == nil
        if tile.collides?(@right_rectangle)

          synchronize_rectangles()
        end


        if tile.collides?(@left_rectangle)

          synchronize_rectangles()
        end

        if tile.collides?(@up_rectangle)

          synchronize_rectangles()
        end

        if tile.collides?(@down_rectangle)

          synchronize_rectangles()
        end
    end
  end

  def draw

    @image.draw(@monsterx,@monstery,1)
  end

  def synchronize_rectangles
    @right_rectangle.x = @monsterx + @image.width - @right_rectangle.width
    @right_rectangle.y = @monstery + 5

    @left_rectangle.x = @monsterx
    @left_rectangle.y = @monstery + 5

    @up_rectangle.x = @monsterx + 5
    @up_rectangle.y = @monstery

    @down_rectangle.x = @monsterx + 5
    @down_rectangle.y = @monstery + @image.height - @down_rectangle.height
  end
end
