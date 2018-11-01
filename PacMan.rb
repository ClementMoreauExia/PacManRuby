require "gosu"
require "./PacManPlayer.rb"
require "./Monsters.rb"
require "./map.rb"
require "./tile.rb"
require "./rectangle.rb"
require "./score.rb"


class PacManGame < Gosu::Window
  def initialize width=640, height=736 , fullscreen=false
    super
    self.caption = "Pac-Man"
    @map = Map.new("map/mapOpen.map")
    @score = Score.new self
    @pacManPlayer = PacManPlayer.new self
    @redMonster = Monsters.new(self,"red",256,320)
    @blueMonster = Monsters.new(self,"blue",288,320)
    @orangeMonster = Monsters.new(self,"orange",320,320)
    @pinkMonster = Monsters.new(self,"pink",352,320)

  end

  def update
    @pacManPlayer.update(@map)
    @blueMonster.update(@map)
    @map.update

  end

  def draw
    # @background_image.draw(0,0,0)
    @map.draw
    @score.draw
    @pacManPlayer.draw
    @redMonster.draw
    @blueMonster.draw
    @orangeMonster.draw
    @pinkMonster.draw
  end
end
PacManGame.new.show
