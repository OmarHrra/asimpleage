class Engine::GameManager
  attr_accessor :ui_objects, :game_objects, :options, :world, :camera, :ui, :players,
                :debug

  def initialize
    @ui_objects = []
    @game_objects = []

    @options = Engine::Options.new self
    @debug = Engine::Debug.new self if @options.debug
  end
end
