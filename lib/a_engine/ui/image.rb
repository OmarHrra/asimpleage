class AEngine::Ui::Image < AEngine::GameObject
  include AEngine::Ui::Scalable

  def initialize(game_manager, **attrs)
    attrs[:fixed_at_camera] = true if attrs[:fixed_at_camera].nil?
    attrs[:z] = game_manager.options.ui_z_index if attrs[:z].nil?

    super(game_manager, **attrs)

    apply_ui_scale
    position_warning
  end
end
