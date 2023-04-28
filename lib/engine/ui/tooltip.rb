class Engine::Ui::Tooltip
  attr_accessor :game_manager, :raw_text, :text, :texts, :box_padding, :space_beetween_lines,
                :line_box, :box, :min_width, :min_height, :max_width, :max_height, :visible

  def initialize(game_manager, raw_text, **attrs)
    @game_manager = game_manager

    @raw_text = raw_text
    @text_attrs = attrs.except(
      :min_width, :min_height, :max_width, :max_height, :box_padding, :space_beetween_lines
    )

    @text = Text.new(raw_text, **@text_attrs)
    @texts = []

    @min_width = attrs[:min_width]
    @min_height = attrs[:min_height]
    @max_width = attrs[:max_width]
    @max_height = attrs[:max_height]

    @box_padding = attrs[:box_padding] || 5
    @space_beetween_lines = attrs[:space_beetween_lines] || 4
    @visible = true

    draw
  end

  def update
    remove_all
    draw
  end

  def draw
    return unless @visible

    multiline
    box

    @texts.each_with_index do |text, index|
      text.text = text_splitted[index]
    end
  end

  def remove_all
    @line_box.remove
    @box.remove
    @text.remove
    @texts.each { |text| text.remove }

    # @line_box = nil
    # @box = nil
    @texts = []
  end

  private

  def multiline
    height = @text.height
    @text.remove

    text_splitted.each_with_index do |line, index|
      y = @text.y
      y += (index * (height + @space_beetween_lines)) if(index > 0)

      @texts.push(
        Text.new(line, **(@text_attrs.merge(y: y, x: @text.x + @box_padding)))
      )
    end
  end

  def text_splitted
    @raw_text.split("\n")
  end

  def box
    # In case of initial @raw_text is an empty string
    if not @raw_text.empty?
      x = @texts.first.x
      y = @texts.first.y
  
      width = @texts.map(&:width).max
      height = @texts.sum(&:height)
    else
      x = 0
      y = 0
  
      width = 0
      height = 0
    end

    width = @min_width if !@min_width.nil? && @min_width > width
    height = @min_height if !@min_height.nil? && @min_height > height

    width = @max_width if !@max_width.nil? && width > @max_width
    height = @min_height if !@min_height.nil? && height > @min_height

    @line_box = Line.new(
      x1: x - @box_padding,
      x2: x + width + @box_padding,
      y1: y - @box_padding - 1,
      y2: y - @box_padding - 1,
      width: 2,
      color: @game_manager.options.main_color,
      z: @game_manager.options.ui_z_index - 1
    )

    @box = Rectangle.new(
      x: x - @box_padding,
      y: y - @box_padding,
      width: width + @box_padding * 2,
      height: height + @space_beetween_lines * @texts.count + @box_padding * 2,
      z: @game_manager.options.ui_z_index - 1,
      color: [0, 0, 0, 0.7]
    )
  end
end
