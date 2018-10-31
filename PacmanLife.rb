class PacmanLife
  def initialize (window, numberOfLifes)
    @window = window
    @LifePicture = Gosu::Image.new @window, "media/pacManRight.png"
    @xLife = 0
    @yLife = 704
    @numberOfLifes = numberOfLifes
    @moveRight = 0
  end

  def update
  end

  def draw
    # for i in 0..@numberOfLifes do
    #   @LifePicture.draw(@xLife + @moveRight,@yLife,1)
    #   @moveRight += 32
    # end

    @i = 0
    while @i < @numberOfLifes  do
      @LifePicture.draw(@xLife + @moveRight ,@yLife,1)
      @moveRight += 32
      @i += 1
    end
  end
end
