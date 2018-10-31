class PacmanLife
  def initialize (window, xLife, yLife)
    @window = window
    @LifePicture = Gosu::Image.new @window, "media/pacManRight.png"
    @xLife = xLife
    @yLife = yLife
  end

  def update
  end

  def draw
    @LifePicture.draw(@xLife, @yLife,1)
  end
end
