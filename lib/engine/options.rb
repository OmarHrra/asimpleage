class Engine::Options
  attr_accessor :game_manager, :resolution, :resolution_reference, :ui_scale, :font_size,
                :ui_z_index, :debug, :main_color, :secondary_color

  def initialize(game_manager)
    @game_manager = game_manager

    @resolution = {
      x: 1920,
      y: 1080
    }

    @ui_scale = 1
    @font_size = 20
    @ui_z_index = 1000

    @main_color = '#a5854e'
    @secondary_color = '#273146'

    @debug = true
  end
end
