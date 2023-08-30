class AEngine::World
  attr_accessor :game_manager, :width, :height, :surface, :tile_width, :tile_height

  def initialize(game_manager)
    @game_manager = game_manager

    @tile_width = 481
    @tile_height = 241
  end

  def generate
    # 0 = void
    # 1 = floor
    # 2 = water
    @surface = [
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    ].transpose

    # @surface = [[]]
    # @width = @surface.first.count * @tile_width
    # @height = @surface.count * @tile_height

    @width = 200
    @height = 200
  end

  def draw
    @surface.each_with_index do |row, index_1|
      row.each_with_index do |column_value, index_2|
        @game_manager.game_objects << AEngine::GameObject.new(@game_manager, 
          type: :image,
          path: column_value == 1 ? 'assets/images/floor2.png' : 'assets/images/water2.png',
          x: (@tile_width / 2) * index_1 + (@tile_width / 2) * index_2,
          y: -(@tile_height / 2) * index_1 + (@tile_height / 2) * index_2 - (@tile_height * 13) / 32 + 1,
          z: index_1 + index_2,
        )
      end
    end
  end
end
