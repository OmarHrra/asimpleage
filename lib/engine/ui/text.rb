class Engine::Ui::Text < Text
  include Engine::Ui::Scalable

  attr_accessor :game_manager

  def initialize(game_manager, raw_text, **attrs)
    attrs[:size] *= game_manager.options.ui_scale

    super(raw_text, **attrs)

    @game_manager = game_manager

    apply_ui_scale
    position_warning
  end
end
