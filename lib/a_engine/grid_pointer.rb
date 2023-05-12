class AEngine::GridPointer
  include AEngine::GridPositionCalculator

  attr_accessor :game_manager, :pointer

  def initialize(game_manager)
    @game_manager = game_manager

    @pointer = AEngine::GameObject.new(@game_manager, 
      type: :image,
      path: 'assets/images/pointer.png',
      x: 0,
      y: 0,
      z: 50,
    )

    @game_manager.game_objects << @pointer
  end

  def update
    grid_position
    world_position_by_grid_position

    # GameObject position
    @pointer.x = @pointer_world_x
    @pointer.y = @pointer_world_y
  end
end
