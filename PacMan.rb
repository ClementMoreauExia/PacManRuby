require "gosu"
load "PacManPlayer.rb"
load "Monsters.rb"



class PacManGame < Gosu::Window
  def initialize width=672, height=744, fullscreen=false
    super
    self.caption = "Pac-Man"
    @background_image = Gosu::Image.new("media/mapOpen.png", :tileable => true)
    @pacManPlayer = PacManPlayer.new self
    @Monsters = Monsters.new self
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @pacManPlayer.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @pacManPlayer.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
      @pacManPlayer.turn_up
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
      @pacManPlayer.turn_down
    end
    @pacManPlayer.move
  end

  def draw
    @background_image.draw(0,0,0)
    @pacManPlayer.draw
    @Monsters.draw
  end
end
PacManGame.new.show
