class Monsters
  def initialize window
    @window = window
    @RedMonster = Gosu::Image.new(@window,"media/Red.png")
    @xRed = 265
    @yRed = 345
    @BlueMonster = Gosu::Image.new @window, "media/Blue.png"
    @xBlue = 300
    @yBlue = 345
    @OrangeMonster = Gosu::Image.new @window, "media/Orange.png"
    @xOrange = 335
    @yOrange = 345
    @PinkMonster = Gosu::Image.new @window, "media/Pink.png"
    @xPink = 370
    @yPink = 345
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
