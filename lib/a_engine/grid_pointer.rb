class AEngine::GridPointer
  attr_accessor :game_manager, :pointer, :grid_x, :grid_y, :width, :height, :mouse_world_x, :mouse_world_y,
                :pointer_world_x, :pointer_world_y

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

    @width = @game_manager.options.tile_width
    @height = @game_manager.options.tile_height
  end

  def update
    # World positions
    @mouse_world_x = (@game_manager.camera.mouse_x + @game_manager.camera.x - @width/2)
    @mouse_world_y = (@game_manager.camera.mouse_y + @game_manager.camera.y - @height/2)

    # Grid position
    grid_position

    # Pointer world position
    pointer_world_position
    
    # GameObject position
    @pointer.x = @pointer_world_x
    @pointer.y = @pointer_world_y
  end

  private

  def grid_position
    @grid_x = ((@mouse_world_x / @width)) + (-1 * (@mouse_world_y / @height))
    @grid_y = ((@mouse_world_y / @height)) + (@mouse_world_x / @width)

    # Pixel correction
    @grid_x += @grid_x*0.01
    # y difference
    @grid_x += ((@mouse_world_y / @height) / 100) * -1
    @grid_x = @grid_x.round

    # Pixel correction
    @grid_y += @grid_y*0.02
    # x difference
    @grid_y += ((@mouse_world_x / @width) / 100) * -1
    @grid_y = @grid_y.round
  end

  def pointer_world_position
    @pointer_world_x = @grid_x * @width / 2 + (@grid_y * @width / 2)
    @pointer_world_y = @grid_y * @height / 2 - (@grid_x * @height / 2)

    # Pixel correction
    @pointer_world_x -= @pointer_world_x*0.0101115
    # y difference
    @pointer_world_x -= ((@mouse_world_y / @height) / 100) * -1

    # Pixel correction
    @pointer_world_y -= @pointer_world_y*0.0202225
    # x difference
    @pointer_world_y -= ((@mouse_world_x / @width) / 100) * -1
  end
end
