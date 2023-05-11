class AEngine::World
  attr_accessor :game_manager, :width, :height, :surface, :tile_width, :tile_height

  def initialize(game_manager)
    @game_manager = game_manager

    @tile_width = 724
    @tile_height = 725
  end

  def generate
    @surface = [[]]
    @width = 200
    @height = 200
  end

  def draw
    @surface.each_with_index do |row, index_1|
      row.each_with_index do |column_value, index_2|
        @game_manager.game_objects << AEngine::GameObject.new(@game_manager, 
          type: :image,
          path: 'assets/images/test.png',
          x: (@tile_width / 2) * index_1 + (@tile_width / 2) * index_2,
          y: -(@tile_height / 2) * index_1 + (@tile_height / 2) * index_2
        )
      end
    end
  end
end