class PacManPlayer
  attr_reader :endGameV
  def initialize window
    @window = window
    @image = Gosu::Image.new @window, "media/pacManLeft.png"
    @xpac = 320
    @ypac = 384
    @move = nil
    @xmove = 0
    @ymove = 0

    @right = true
    @left = true
    @up = true
    @down = true

    @right_rectangle = Rectangle.new(0, 0,5, @image.height-10)
    @left_rectangle = Rectangle.new(0, 0,5, @image.height-10)
    @up_rectangle = Rectangle.new(0, 0, @image.height-10, 5)
    @down_rectangle = Rectangle.new(0, 0, @image.height-10, 5)

    @endGameV = false
  end

  def update(map,score)
    movement()
    collidesPacMan(map,score)
    endGame(map,score)
  end

  def draw
    @image.draw(@xpac,@ypac,1)


  end

  def endGame(map,score)
    @nbCollectable = 0
    map.tiles.each do |tile|
      next if tile == nil

        if tile.type != 1
          @nbCollectable +=1
        end
    end
    if @nbCollectable == 0 and @endGameV == false
      puts "End"
      @endGameV = true
      score.saveScore
    end
  end

  def collidesPacMan(map,score)

    synchronize_rectangles()
    @tileNumber = 0
    map.tiles.each do |tile|

      if tile == nil
        @tileNumber += 1
      end

      next if tile == nil
      if tile.type == 1
        if tile.collides?(@right_rectangle) and @move == 'right'
          @xmove = 0
          @ymove = 0
          synchronize_rectangles()
        end


        if tile.collides?(@left_rectangle) and @move == 'left'
          @xmove = 0
          @ymove = 0
          synchronize_rectangles()
        end

        if tile.collides?(@up_rectangle) and @move == 'up'
          @xmove = 0
          @ymove = 0
          synchronize_rectangles()
        end

        if tile.collides?(@down_rectangle) and @move == 'down'
          @xmove = 0
          @ymove = 0
          synchronize_rectangles()
        end
      end
      if tile.type == 2
        if ((tile.collides?(@right_rectangle) and @move == 'right') or
          (tile.collides?(@left_rectangle) and @move == 'left' )  or
          (tile.collides?(@up_rectangle) and @move == 'up') or
          (tile.collides?(@down_rectangle) and @move == 'down'))

          map.tiles[@tileNumber] = nil
          score.addPointScore
        end
      end
      if tile.type == 3
        if ((tile.collides?(@right_rectangle) and @move == 'right') or
          (tile.collides?(@left_rectangle) and @move == 'left' )  or
          (tile.collides?(@up_rectangle) and @move == 'up') or
          (tile.collides?(@down_rectangle) and @move == 'down'))

          map.tiles[@tileNumber] = nil

        end
      end
      @tileNumber += 1
    end
  end

  def movement
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT and @move != 'left'
      @image = Gosu::Image.new @window, "media/pacManLeft.png"
      @move = 'left'
      @xmove = -2
      @ymove = 0
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT and @move != 'right'
      @image = Gosu::Image.new @window, "media/pacManRight.png"
      @move = 'right'
      @xmove = 2
      @ymove = 0

    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP and @move != 'up'
      @image = Gosu::Image.new @window, "media/pacManUp.png"
      @move = 'up'
      @xmove = 0
      @ymove = -2
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN and @move != 'down'
      @image = Gosu::Image.new @window, "media/pacManDown.png"
      @move = 'down'
      @xmove = 0
      @ymove = 2
    end
    @xpac += @xmove
    @ypac += @ymove
  end

  def synchronize_rectangles
    @right_rectangle.x = @xpac + @image.width - @right_rectangle.width
    @right_rectangle.y = @ypac + 5

    @left_rectangle.x = @xpac
    @left_rectangle.y = @ypac + 5

    @up_rectangle.x = @xpac + 5
    @up_rectangle.y = @ypac

    @down_rectangle.x = @xpac + 5
    @down_rectangle.y = @ypac + @image.height - @down_rectangle.height
  end
end
