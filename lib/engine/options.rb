class Engine::Options
  attr_accessor :game_manager, :resolution, :resolution_reference, :ui_scale, :font_size, :debug

  def initialize(game_manager)
    @game_manager = game_manager

    @resolution = {
      x: 1920,
      y: 1080
    }

    @ui_scale = 1
    @font_size = 20

    @debug = true
  end
end
