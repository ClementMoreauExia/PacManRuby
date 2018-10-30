class PacManPlayer
  def initialize window
    @window = window
    @image = Gosu::Image.new @window, "media/pacManLeft.png"
    @xpac = @window.width/2 - @image.width/2
    @ypac = 384
    @xmove = 0
    @ymove = 0

    @rectangle = Rectangle.new(@xpac, @ypac, @image.width, @image.height)
  end

  def update

    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @image = Gosu::Image.new @window, "media/pacManLeft.png"
      @xmove = -2
      @ymove = 0
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @image = Gosu::Image.new @window, "media/pacManRight.png"
      @xmove = 2
      @ymove = 0
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
      @image = Gosu::Image.new @window, "media/pacManUp.png"
      @xmove = 0
      @ymove = -2
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
      @image = Gosu::Image.new @window, "media/pacManDown.png"
      @xmove = 0
      @ymove = 2
    end
    @xpac = @xpac + @xmove
    @ypac = @ypac + @ymove

    @rectangle.x = @xpac
    @rectangle.y = @ypac
  end

  def draw
    @image.draw(@xpac,@ypac,1)
  end
end
