require "gosu"
require "./PacManPlayer.rb"
require "./Monsters.rb"
require "./map.rb"
require "./tile.rb"
require "./rectangle.rb"
require "./PacmanLife"


class PacManGame < Gosu::Window
  def initialize width=640, height=736, fullscreen=false
    super
    self.caption = "Pac-Man"
    @map = Map.new("map/mapOpen.map")
    # @background_image = Gosu::Image.new("media/mapOpen.png", :tileable => true)
    @pacManPlayer = PacManPlayer.new self
    @redMonster = Monsters.new(self,"red",256,320)
    @blueMonster = Monsters.new(self,"blue",288,320)
    @orangeMonster = Monsters.new(self,"orange",320,320)
    @pinkMonster = Monsters.new(self,"pink",352,320)
    @firstLife = PacmanLife.new(self, 0, 704)
    @secondLife = PacmanLife.new(self, 32, 704)
    @thirdLife = PacmanLife.new(self, 64, 704)
  end

  def update
    @pacManPlayer.update(@map.tiles)
    @blueMonster.update(@map.tiles)

  end

  def draw
    # @background_image.draw(0,0,0)
    @map.draw
    @pacManPlayer.draw
    @redMonster.draw
    @blueMonster.draw
    @orangeMonster.draw
    @pinkMonster.draw
    @firstLife.draw
    @secondLife.draw
    @thirdLife.draw
  end
end
PacManGame.new.show
