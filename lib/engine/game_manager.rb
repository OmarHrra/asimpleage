class Engine::GameManager
  attr_accessor :static_ui_objects, :interactive_ui_objects, :game_objects, :options, :world,
                :camera, :ui, :players, :grid_pointer, :debug

  def initialize
    @game_objects = []
    @static_ui_objects = []
    @interactive_ui_objects = []

    @options = Engine::Options.new self

    # Generate world
    @world = Engine::World.new self
    @world.generate
    @world.draw

    # Initial camera position
    @camera = Engine::Camera.new self

    @grid_pointer = Engine::GridPointer.new self

    @debug = Engine::Debug.new self if @options.debug
  end
end
