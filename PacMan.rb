require "gosu"
require "./PacManPlayer.rb"
require "./Monsters.rb"
require "./map.rb"
require "./tile.rb"
require "./rectangle.rb"


class PacManGame < Gosu::Window
  def initialize width=640, height=704, fullscreen=false
    super
    self.caption = "Pac-Man"
    @map = Map.new("map/mapOpen.map")
    # @background_image = Gosu::Image.new("media/mapOpen.png", :tileable => true)
    @pacManPlayer = PacManPlayer.new self
    @Monsters = Monsters.new self
  end

  def update
    @pacManPlayer.update()

  end

  def draw
    # @background_image.draw(0,0,0)
    @map.draw
    @pacManPlayer.draw
    @Monsters.draw
  end
end
PacManGame.new.show
