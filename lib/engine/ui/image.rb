class Engine::Ui::Image < Engine::GameObject
  def initialize(game_manager, **attrs)
    attrs[:fixed_at_camera] = true if attrs[:fixed_at_camera].nil?
    attrs[:x] *= game_manager.options.ui_scale
    attrs[:y] *= game_manager.options.ui_scale
    attrs[:z] = game_manager.options.ui_z_index if attrs[:z].nil?

    super(game_manager, **attrs)

    position_warning
  end

  private

  def position_warning
    if @x < 0 || @x > @game_manager.options.resolution[:x] || @y < 0 || @y > @game_manager.options.resolution[:y]
      puts "Warning: #{self.class.name} is out of camera"
    end
  end
end
