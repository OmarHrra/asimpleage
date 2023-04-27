class Engine::Camera
  attr_accessor :game_manager, :x, :y, :speed, :rotate, :zoom, :threshold, :mouse_x, :mouse_y

  def initialize(game_manager, x = 0, y = 0, speed = 20, rotate = 0, zoom = 100, threshold = 30)
    @game_manager = game_manager
    @x = x
    @y = y
    @rotate = rotate
    @zoom = zoom
    @speed = speed
    @threshold = threshold * @game_manager.options.ui_scale
  end

  def speed
    @speed * (1 / scale)
  end

  def scale
    @zoom / 100.0
  end

  def zoom_in
    @zoom += 10
  end

  def zoom_out
    @zoom -= 10
  end

  def key_held(event)
    case event.key
    when 'd'
      @x += @speed
    when 'a'
      @x -= @speed
    when 's'
      @y += @speed
    when 'w'
      @y -= @speed
    when ','
      @rotate -= 1
    when '.'
      @rotate += 1
    when 'f12'
      @rotate = 0
    when 'keypad +'
      zoom_in
    when 'keypad -'
      zoom_out
    when 'keypad *'
      @zoom = 100
    when 'home'
      @x = 0
      @y = 0
    end
  end

  def update
    @mouse_x = Window.mouse_x
    @mouse_y = Window.mouse_y

    movement
  end

  private

  def movement
    @x += @speed if @mouse_x >= (@game_manager.options.resolution[:x] - @threshold) && @mouse_x <= @game_manager.options.resolution[:x]
    @x -= @speed if @mouse_x <= @threshold && @mouse_x >= 0
    @y += @speed if @mouse_y >= (@game_manager.options.resolution[:y] - @threshold) && @mouse_y <= @game_manager.options.resolution[:y]
    @y -= @speed if @mouse_y <= @threshold && @mouse_y >= 0
  end
end
