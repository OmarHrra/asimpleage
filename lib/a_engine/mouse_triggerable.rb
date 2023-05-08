module AEngine::MouseTriggerable
  attr_accessor :click, :hover, :mouse_x, :mouse_y

  def mouse_up(event)
    mouse_position(event)

    @click = false
    # puts 'mouse_up'
    # puts "click: #{@click}"
  end

  def mouse_down(event)
    mouse_position(event)

    @click = true if mouse_hover?
    # puts 'mouse_down'
    # puts "click: #{@click}"
  end

  def mouse_move(event)
    mouse_position(event)

    mouse_hover?
    # puts "mouse_move hover: #{@hover}"
  end

  private

  def mouse_hover?
    @hover = @object.contains?(@mouse_x, @mouse_y)
  end

  def mouse_position(event)
    @mouse_x = event.x
    @mouse_y = event.y
  end
end
