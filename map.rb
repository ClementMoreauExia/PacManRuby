class Map

  attr_reader :tiles

  def initialize(path)
    file = File.open(path,"r")
    x = 0
    y = 0

    @tiles = []

    file.each_line do |line|
      args = line.split(",")

      args.each do |arg|
        if arg.to_i == 0
          @tiles << nil
        elsif arg.to_i == 1
          @tiles << Tile.new(x,y)
        end
        x+=32
      end
      x = 0
      y += 32
    end
  end

  def draw
    @tiles.each do |tile|
      tile.draw if tile != nil
    end
  end

end
