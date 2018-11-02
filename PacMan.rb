require "gosu"
require "./PacManPlayer.rb"
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

  end

  def update
    @pacManPlayer.update(@map,@score)
    @score.update(@pacManPlayer.endGameV)
  end

  def draw
    @map.draw
    @score.draw(@pacManPlayer.endGameV)
    @pacManPlayer.draw
  end
end
PacManGame.new.show
