require_relative "../2d/element"

class Card < Element
  def initialize(x, y, width, height)
    super

    @border = []

    # Create a new shape
    @background = Rectangle.new(
      x: @x,
      y: @y,
      width: @width,
      height: @height,
      color: @color || "white",
    )

    @border.push(
      Line.new(
        x1: @x,
        y1: @y,
        x2: @x + @width,
        y2: @y,
        width: 5,
        color: "gray",
      ),
      Line.new(
        x1: @x,
        y1: @y,
        x2: @x,
        y2: @y + height,
        width: 5,
        color: "gray",
      ),
      Line.new(
        x1: @x,
        y1: @y + height,
        x2: @x + @width,
        y2: @y + height,
        width: 5,
        color: "gray",
      ),
      Line.new(
        x1: @x + width,
        y1: @y,
        x2: @x + width,
        y2: @y + height,
        width: 5,
        color: "gray",
      ),
      Circle.new(
        x: @x,
        y: @y,
        radius: 2.5,
        color: "gray"
      ),
      Circle.new(
        x: @x + @width,
        y: @y,
        radius: 2.5,
        color: "gray"
      ),
      Circle.new(
        x: @x,
        y: @y + @height,
        radius: 2.5,
        color: "gray"
      ),
      Circle.new(
        x: @x + @width,
        y: @y + @height,
        radius: 2.5,
        color: "gray"
      ),
    )

    # Show the window
  end

  def on_mouse_enter(x, y, button)
    super

    @border.each do |element|
      element.color = "yellow"
    end
  end

  def on_mouse_leave(x, y, button)
    super

    @border.each do |element|
      element.color = "gray"
    end
    on_mouse_up(x, y, button)
  end

  def on_mouse_down(x, y, button)
    super

    @background.color = "blue"
  end

  def on_mouse_up(x, y, button)
    super

    @background.color = "white"
  end
end
