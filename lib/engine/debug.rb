class Engine::Debug
  def initialize(game_manager)
    @game_manager = game_manager
    color = '#0affb1'
    x = 0
    y = 58
    font_size = @game_manager.options.font_size * @game_manager.options.ui_scale

    Rectangle.new(x: x + 7, y: y +7, width: 300, height: 130, z: 999, color: [0, 0, 0, 0.5])
    @fps_text = Text.new('', x: x + 10, y: y + 10, z: 1000, size: font_size, color: color)
    @in_screen_text = Text.new('', x: x + 10, y: y + 30, z: 1000, size: font_size, color: color)
    @ui_in_screen_text = Text.new('', x: x + 10, y: y + 50, z: 1000, size: font_size, color: color)
    @camera_text = Text.new('', x: x + 10, y: y + 70, z: 1000, size: font_size, color: color)
    @mouse_text = Text.new('', x: x + 10, y: y + 90, z: 1000, size: font_size, color: color)
  end

  def update
    @fps_text.text = (Window.get :fps).round(0).to_s + ' FPS'
    @in_screen_text.text = "In screen: #{@game_manager.game_objects.select { |obj| obj.visible }.count}"
    @ui_in_screen_text.text = "UI in screen: #{@game_manager.ui_objects.select { |obj| obj.visible }.count}"
    @camera_text.text = "Camera: #{@game_manager.camera.x}, #{@game_manager.camera.y}"
    @mouse_text.text = "Mouse: #{@game_manager.camera.mouse_x}, #{@game_manager.camera.mouse_y}"
  end
end
