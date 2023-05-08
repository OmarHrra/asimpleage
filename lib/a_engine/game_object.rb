class AEngine::GameObject
  attr_accessor :game_manager, :type, :object, :path, :x, :y, :width, :height, :color, :rotate, :z,
                :opacity, :fixed_at_camera, :visible, :always_visible

  def initialize(game_manager, **attrs)
    @game_manager = game_manager
    @type = attrs[:type].to_sym
    define_attriutes(attrs)
    @object = draw

    # Re-define attributes using the variables from the object
    define_attriutes

    @fixed_at_camera = attrs[:fixed_at_camera] || false
    @visible = true
    @always_visible = attrs[:always_visible] || false
  end

  def update
    unless @fixed_at_camera
      movement_by_camera
      out_of_camera
    end
  end

  def draw
    case @type
    when :image
      Image.new(@path, **attributes_by_object)
    else
      raise 'Not a valid type'
    end
  end

  private

  def define_attriutes(attrs = nil)
    # Image
    @path = @object&.path || attrs[:path]
    @x = @object&.x || attrs[:x]
    @y = @object&.y || attrs[:y]
    @width = @object&.width || attrs[:width]
    @height = @object&.height || attrs[:height]
    @color = @object&.color || attrs[:color]
    @rotate = @object&.rotate || attrs[:rotate]
    @opacity = attrs[:opacity] || 1 if not attrs.nil?
    @z = @object&.z || attrs[:z]
  end

  def attributes_by_object
    case @type
    when :image
      {
        x: @x,
        y: @y,
        width: @width,
        height: @height,
        color: @color,
        rotate: @rotate,
        opacity: @opacity,
        z: @z
      }.reject { |key, value| value.nil? }
    else
      raise 'Not a valid type'
    end
  end

  def movement_by_camera
    x = (@x - @game_manager.camera.x) * @game_manager.camera.scale
    y = (@y - @game_manager.camera.y) * @game_manager.camera.scale

    @object.x = x
    @object.y = y
    @object.rotate = @rotate + @game_manager.camera.rotate
    @object.width = @width * @game_manager.camera.scale
    @object.height = @height * @game_manager.camera.scale
  end

  def out_of_camera
    return if @always_visible

    if not @object.x >= -(@game_manager.world.tile_width * @game_manager.camera.scale) && @object.x <= @game_manager.options.resolution[:x] && @object.y >= -(@game_manager.world.tile_height * @game_manager.camera.scale) && @object.y <= @game_manager.options.resolution[:y]
      @object.remove
      @visible = false
    else
      @object.add unless @visible
      @visible = true
    end
  end
end
