class AEngine::Ui::Button < AEngine::Ui::Image
  include AEngine::MouseTriggerable

  def initialize(game_manager, **attrs)
    super(game_manager, **attrs)

    @click = false
    @hover = false
  end
end
