class AEngine::GameManager
  attr_accessor :static_ui_objects, :interactive_ui_objects, :game_objects, :options, :world,
                :camera, :ui, :players, :grid_pointer, :debug

  def initialize
    @game_objects = []
    @static_ui_objects = []
    @interactive_ui_objects = []

    @options = AEngine::Options.new self

    # Generate world
    @world = AEngine::World.new self
    @world.generate
    @world.draw

    # Initial camera position
    @camera = AEngine::Camera.new self

    @grid_pointer = AEngine::GridPointer.new self

    @debug = AEngine::Debug.new self if @options.debug
  end
end
