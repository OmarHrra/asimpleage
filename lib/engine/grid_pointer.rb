class Engine::GridPointer
  attr_accessor :game_manager, :pointer, :x, :y, :width, :height

  def initialize(game_manager)
    @game_manager = game_manager

    @pointer = Engine::GameObject.new(@game_manager, 
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
    # GameObject position
    @pointer.x = (@game_manager.camera.mouse_x + @game_manager.camera.x - @pointer.width/2)
    @pointer.y = (@game_manager.camera.mouse_y + @game_manager.camera.y - @pointer.height/2)

    # Grid position
    grid_position
  end

  private

  def grid_position
    @x = ((@pointer.x / @width)) + (-1 * (@pointer.y / @height))
    y_difference = ((@pointer.y / @height) / 100) * -1

    # Pixel correction
    @x += x*0.01
    @x += y_difference
    @x = @x.round


    @y = ((@pointer.y / @height)) + (@pointer.x / @width)
    x_difference = ((@pointer.x / @width) / 100) * -1

    # Pixel correction
    @y += y*0.02
    @y += x_difference
    @y = @y.round
  end
end
