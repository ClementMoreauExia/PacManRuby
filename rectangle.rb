class Rectangle

    attr_accessor :x, :y, :width, :height

  def initialize(x,y,width,height)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  def draw
    Gosu.draw_rect(@x, @y, @width, @height,Gosu::Color::WHITE, 0)
  end

  def collides?(rect)
    if not rect.is_a? Rectangle
      raise "Erreur: Pas un rectangle!"
    end

    if rect.x > @x + @width or
      rect.x + rect.width < @x or
      rect.y > @y + @height or
      rect.y + rect.height < @y
      return false
    end
    return true
  end

end
