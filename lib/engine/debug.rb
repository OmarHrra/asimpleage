class Engine::Debug
  attr_accessor :game_manager, :tooltip

  def initialize(game_manager)
    @game_manager = game_manager

    @tooltip = Engine::Ui::Tooltip.new(game_manager,
      "",
      x: 7,
      y: 68,
      z: @game_manager.options.ui_z_index,
      size: @game_manager.options.font_size * @game_manager.options.ui_scale,
      color: '#0ffc03',
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

    str = "#{@fps} FPS\nIn screen #{@in_screen}\nUI in screen #{@ui_in_screen}\nCamera: #{@camera}\nMouse: #{@mouse}"

    @tooltip.raw_text = str
  end
end
