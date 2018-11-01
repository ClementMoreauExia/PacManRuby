class Score
  def initialize window
@score = 0
@texte =  Gosu::Image.from_text(window, 'HELLO WORLD', Gosu.default_font_name, 45)
  end

  def draw
    @texte.draw(330,736,1)
  end

end
