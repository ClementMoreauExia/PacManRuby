class PacManPlayer
  def initialize window
    @window = window
    @image = Gosu::Image.new @window, "media/pacManLeft.png"
    @xpac = @window.width/2 - @image.width/2
    @ypac = 384
    @move = 'null'
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
  end

  def update(tiles)


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

    synchronize_rectangles()
    tiles.each do |tile|
      next if tile == nil
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


  end

  def draw
    @image.draw(@xpac,@ypac,1)

    # @right_rectangle.draw
    # @left_rectangle.draw
    # @up_rectangle.draw
    # @down_rectangle.draw

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
