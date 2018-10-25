class PacManPlayer
  def initialize window
    @window = window
    @image = Gosu::Image.new @window, "media/pacManLeft.png"
    @xpac = @window.width/2 - @image.width/2
    @ypac = 404
    @xmove = 0
    @ymove = 0
  end

  def turn_left
    @image = Gosu::Image.new @window, "media/pacManLeft.png"
    @xmove = -2
    @ymove = 0
  end

  def turn_right
    @image = Gosu::Image.new @window, "media/pacManRight.png"
    @xmove = 2
    @ymove = 0
  end

  def turn_up
    @image = Gosu::Image.new @window, "media/pacManUp.png"
    @xmove = 0
    @ymove = -2
  end

  def turn_down
    @image = Gosu::Image.new @window, "media/pacManDown.png"
    @xmove = 0
    @ymove = 2
  end

  def move
    @xpac = @xpac + @xmove
    @ypac = @ypac + @ymove
  end

  def update
  end

  def draw
    @image.draw(@xpac,@ypac,1)
  end
end
