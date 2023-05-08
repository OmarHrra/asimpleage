class AEngine::Options
  attr_accessor :game_manager, :resolution, :resolution_reference, :ui_scale, :font_size,
                :ui_z_index, :debug, :main_color, :secondary_color, :tile_width, :tile_height

  def initialize(game_manager)
    @game_manager = game_manager

    @resolution = {
      x: 1920,
      y: 1080
    }

    @ui_scale = 1
    @font_size = 20
    @ui_z_index = 10000

    @main_color = '#a5854e'
    @secondary_color = '#273146'

    @tile_width = 97
    @tile_height = 49

    @debug = true
  end
end
