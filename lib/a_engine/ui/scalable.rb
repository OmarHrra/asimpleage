module AEngine::Ui::Scalable
  private

  def apply_ui_scale
    case self.class.name
    when 'AEngine::Ui::Image', 'AEngine::Ui::Button'
      scale_ui_image
    when 'AEngine::Ui::Text'
      scale_ui_text
    when 'AEngine::Ui::Tooltip'
      scale_ui_tooltip
    end
  end

  def scale_ui_image
    @x *= @game_manager.options.ui_scale
    @y *= @game_manager.options.ui_scale
    @width *= @game_manager.options.ui_scale
    @height *= @game_manager.options.ui_scale

    @object.x *= @game_manager.options.ui_scale
    @object.y *= @game_manager.options.ui_scale
    @object.width *= @game_manager.options.ui_scale
    @object.height *= @game_manager.options.ui_scale
  end

  def scale_ui_text
    @x *= @game_manager.options.ui_scale
    @y *= @game_manager.options.ui_scale
  end

  def scale_ui_tooltip
    @box_padding *= @game_manager.options.ui_scale
    # @space_beetween_lines *= @game_manager.options.ui_scale
  end

  def position_warning
    if @x < 0 || @x > @game_manager.options.resolution[:x] || @y < 0 || @y > @game_manager.options.resolution[:y]
      puts "Warning: #{self.class.name} is out of camera"
    end
  end
end