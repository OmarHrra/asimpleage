module AEngine::GridPositionCalculator
  attr_accessor :mouse_world_x, :mouse_world_y, :grid_x, :grid_y, :pointer_world_x, :pointer_world_y

  private

  def mouse_world_x
    (@game_manager.camera.mouse_x + @game_manager.camera.x - individual_tile_width / 2)
  end

  def mouse_world_y
    (@game_manager.camera.mouse_y + @game_manager.camera.y - individual_tile_height / 2)
  end

  def individual_tile_width
    @game_manager.options.individual_tile_width
  end

  def individual_tile_height
    @game_manager.options.individual_tile_height
  end

  def grid_position
    @grid_x = ((mouse_world_x / individual_tile_width)) + (-1 * (mouse_world_y / individual_tile_height))
    @grid_y = ((mouse_world_y / individual_tile_height)) + (mouse_world_x / individual_tile_width)

    ## Pixel correction
    @grid_x += @grid_x*0.01
    # y difference
    @grid_x += ((mouse_world_y / individual_tile_height) / 100) * -1
    @grid_x = @grid_x.round

    ## Pixel correction
    @grid_y += @grid_y*0.02
    # x difference
    @grid_y += ((mouse_world_x / individual_tile_width) / 100) * -1

    @grid_y = @grid_y.round
  end

  def world_position_by_grid_position(grid_x = nil, grid_y = nil)
    @grid_x = grid_x unless grid_x.nil?
    @grid_y = grid_y unless grid_y.nil?

    @pointer_world_x = @grid_x * individual_tile_width / 2 + (@grid_y * individual_tile_width / 2)
    @pointer_world_y = @grid_y * individual_tile_height / 2 - (@grid_x * individual_tile_height / 2)

    # Pixel correction
    @pointer_world_x -= @pointer_world_x*0.0101115
    # y difference
    @pointer_world_x -= ((mouse_world_y / individual_tile_height) / 100) * -1

    # Pixel correction
    @pointer_world_y -= @pointer_world_y*0.0202225
    # x difference
    @pointer_world_y -= ((mouse_world_x / individual_tile_width) / 100) * -1
  end
end
