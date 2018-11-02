class Score

  attr_accessor :score
  def initialize window
    @window = window
    @score = 0
    @text =  Gosu::Image.from_text(@window,@score, "media/Joystix.TTF", 32)
    @timeStart = Time.now
    @timer =  Gosu::Image.from_text(@window,0, "media/Joystix.TTF", 32)

    @multiplicator = 2.5
  end

  def update(endGame)
  @text =  Gosu::Image.from_text(@window,@score,"media/Joystix.TTF", 32)
  if endGame == false
  timer()
  end
  if endGame == true

  end

  end

  def draw(endGame)
    @text.draw(530,704,1)
    @timer.draw(20,704,1)
    if endGame
      scoreBoard()
    end
  end

  def addPointScore
    @score +=100
  end

  def timer
    @timeNow = Time.now
    @delta = @timeNow - @timeStart
    @delta = @delta.to_s.split(".")[0] +"."+ @delta.to_s.split(".")[1].split("")[0] + @delta.to_s.split(".")[1].split("")[1]
    @timer =  Gosu::Image.from_text(@window,@delta, "media/Joystix.TTF", 32)
  end

  def saveScore

    @scoreF = @score * (@multiplicator - (@delta.to_f/100))
    File.open("score.txt", 'a') do |line|
      line.puts(@delta + "," + @scoreF.to_s.split(".")[0])
    end
  end

  def hightScore

    file = File.open("score.txt", 'r')
    file.each_line do |line|
      args = line.split(",")
      @timeLine =  args[0].to_f
      if @hightTime == nil
        @hightTime = args[0].to_f
      end
      if @timeLine <= @hightTime
        @hightTime = @timeLine
        @hightScore =  args[1].to_f
      end
    end
  end

  def scoreBoard
    Gosu.draw_rect(0,0,@window.width,@window.height,Gosu::Color::BLACK,2)
    @title = Gosu::Image.from_text(@window,"PACMAN","media/PAC-FONT.TTF", 100)
    @title2 = Gosu::Image.from_text(@window,"SCOREBOARD","media/PAC-FONT.TTF", 50)

    @timerText =  Gosu::Image.from_text(@window,"Your Time: " + @delta.to_s + " s", "media/Joystix.TTF", 40)
    @scoreText =  Gosu::Image.from_text(@window,"Your Score: " + @scoreF.to_s.split(".")[0],"media/Joystix.TTF", 40)

    hightScore()
    @title3 = Gosu::Image.from_text(@window,"HIGHTSCORE","media/PAC-FONT.TTF", 50)
    @hightTimerText =  Gosu::Image.from_text(@window,"Best Time: " + @hightTime.to_s + " s", "media/Joystix.TTF", 40)
    @hightScoreText =  Gosu::Image.from_text(@window,"Best Score: " + @hightScore.to_s.split(".")[0],"media/Joystix.TTF", 40)

    @title.draw(40,100,2,1,1,Gosu::Color::YELLOW)
    @title2.draw(80,210,2,1,1,Gosu::Color::YELLOW)

    @timerText.draw(50,300,2)
    @scoreText.draw(50,350,2)

    @title3.draw(95,440,2,1,1,Gosu::Color::YELLOW)
    @hightTimerText.draw(50,530,2)
    @hightScoreText.draw(50,580,2)
  end



  end
