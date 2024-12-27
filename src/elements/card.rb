require_relative "../2d/element"

class Card < Element
  def initialize(x, y, width, height)
    super

    @background = "white"
    @border = "gray"
    @hovering = false
  end

  def listens_to_event?
    true
  end

  def render
    super

    y = @hovering ? @y - 10 : @y
    z = @hovering ? 10 : 1
    border = @hovering ? "yellow" : "gray"

    Line.new(
      x1: @x,
      y1: y,
      x2: @x + @width,
      y2: y,
      z: z,
      width: 5,
      color: border,
    )
    Line.new(
      x1: @x,
      y1: y,
      x2: @x,
      y2: y + height,
      z: z,
      width: 5,
      color: border,
    )
    Line.new(
      x1: @x,
      y1: y + height,
      x2: @x + @width,
      y2: y + height,
      z: z,
      width: 5,
      color: border,
    )
    Line.new(
      x1: @x + width,
      y1: y,
      x2: @x + width,
      y2: y + height,
      z: z,
      width: 5,
      color: border,
    )
    Circle.new(
      x: @x,
      y: y,
      z: z,
      radius: 2.5,
      color: border,
    )
    Circle.new(
      x: @x + @width,
      y: y,
      z: z,
      radius: 2.5,
      color: border,
    )
    Circle.new(
      x: @x,
      y: y + @height,
      z: z,
      radius: 2.5,
      color: border,
    )
    Circle.new(
      x: @x + @width,
      y: y + @height,
      z: z,
      radius: 2.5,
      color: border,
    )

    Rectangle.new(
      x: @x,
      y: y,
      z: z,
      width: @width,
      height: @height,
      color: @background,
    )
  end

  def on_mouse_enter(x, y, button)
    super

    @hovering = true
  end

  def on_mouse_leave(x, y, button)
    super

    @hovering = false
    on_mouse_up(x, y, button)
  end

  def on_mouse_down(x, y, button)
    super

    @background = "blue"
  end

  def on_mouse_up(x, y, button)
    super

    @background = "white"
  end
end
