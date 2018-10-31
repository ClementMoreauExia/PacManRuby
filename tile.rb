class Tile

  attr_accessor :x, :y

  def initialize(x,y)
    @img = Gosu::Image.new("media/bloc.png")
    @x = x
    @y = y

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

end
