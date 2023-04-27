class Engine::GameManager
  attr_accessor :ui_objects, :game_objects, :options, :world, :camera, :ui, :players

  def initialize
    @ui_objects = []
    @game_objects = []

    @options = Engine::Options.new self
  end
end
