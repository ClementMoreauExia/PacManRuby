class Tile

  attr_accessor :x, :y

  def initialize(x,y,type)
    if type == 1
    @img = Gosu::Image.new("media/bloc.png")
    end

    if type == 2
    @img = Gosu::Image.new("media/CollectablePoint.png")
    end

    if type == 3
    @img = Gosu::Image.new("media/CollectableInv.png")
    end


    @x = x
    @y = y

    if type == nil
    @type = 0
    else
    @type = type
    end

    @rectangle = Rectangle.new(x, y, 32, 32)
  end

  def draw
    @rectangle.x = @x
    @rectangle.y = @y
    @img.draw(@x,@y,0)
  end

  def collides?(rect)
    return @rectangle.collides?(rect)
  end

  def type
    if @type != nil
    return @type
    end
  end

end
