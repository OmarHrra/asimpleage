class AEngine::Debug
  attr_accessor :game_manager, :tooltip

  def initialize(game_manager)
    @game_manager = game_manager

    @tooltip = AEngine::Ui::Tooltip.new(game_manager,
      "",
      x: 7,
      y: 68,
      z: @game_manager.options.ui_z_index,
      size: @game_manager.options.font_size * @game_manager.options.ui_scale,
      color: '#0affb1'
    )
    @game_manager.static_ui_objects << @tooltip
  end

  def update
    @fps = (Window.get :fps).round(0).to_s
    @in_screen = @game_manager.game_objects.select { |obj| obj.visible }.count
    @ui_in_screen = @game_manager.interactive_ui_objects.select { |obj| obj.visible }.count +
                    @game_manager.static_ui_objects.select { |obj| obj.visible }.count
    @camera = "#{@game_manager.camera.x}, #{@game_manager.camera.y}"
    @mouse = "#{@game_manager.camera.mouse_x}, #{@game_manager.camera.mouse_y}"
    @grid_pointer = "#{@game_manager.grid_pointer.grid_x}, #{@game_manager.grid_pointer.grid_y}"

    str = "#{@fps} FPS\nIn screen #{@in_screen}\n" +
          "UI in screen #{@ui_in_screen}\n" +
          "Camera: #{@camera}\n" +
          "Mouse: #{@mouse}\n" +
          "Grid: #{@grid_pointer}\n" +
          "Pointer World Pos: #{@game_manager.grid_pointer.pointer.x.round}, #{@game_manager.grid_pointer.pointer.y.round}"

    @tooltip.raw_text = str
  end
end
