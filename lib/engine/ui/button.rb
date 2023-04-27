class Engine::Ui::Button < Engine::Ui::Image
  include MouseTriggerable

  def initialize(game_manager, **attrs)
    super(game_manager, **attrs)

    @click = false
    @hover = false
  end
end
