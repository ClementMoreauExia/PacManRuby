class Monsters
  def initialize window
    @window = window
    @RedMonster = Gosu::Image.new(@window,"media/Red.png")
    @xRed = 256
    @yRed = 320
    @BlueMonster = Gosu::Image.new @window, "media/Blue.png"
    @xBlue = 288
    @yBlue = 320
    @OrangeMonster = Gosu::Image.new @window, "media/Orange.png"
    @xOrange = 320
    @yOrange = 320
    @PinkMonster = Gosu::Image.new @window, "media/Pink.png"
    @xPink = 352
    @yPink = 320
    @DeadMonster = Gosu::Image.new @window, "media/Dead.png"
  end

  def update
  end

  def draw
    @RedMonster.draw(@xRed,@yRed,1)
    @BlueMonster.draw(@xBlue,@yBlue,1)
    @OrangeMonster.draw(@xOrange,@yOrange,1)
    @PinkMonster.draw(@xPink,@yPink,1)
  end
end
