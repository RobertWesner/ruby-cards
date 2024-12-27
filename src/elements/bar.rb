require_relative "../2d/element"

class Bar < Element
  def initialize(x, y, width, height, rtl = false)
    super(x, y, width, height)

    @rtl = rtl
  end

  def listens_to_event?
    false
  end

  def render
    super

    Line.new(
      x1: @x,
      y1: @y,
      x2: @x + @width,
      y2: @y,
      width: 5,
      color: "gray",
    )
    Line.new(
      x1: @x,
      y1: @y,
      x2: @x,
      y2: @y + @height,
      width: 5,
      color: "gray",
    )
    Line.new(
      x1: @x,
      y1: @y + @height,
      x2: @x + @width,
      y2: @y + @height,
      width: 5,
      color: "gray",
    )
    Line.new(
      x1: @x + @width,
      y1: @y,
      x2: @x + @width,
      y2: @y + @height,
      width: 5,
      color: "gray",
    )
    Circle.new(
      x: @x,
      y: y,
      radius: 2.5,
      color: "gray",
    )
    Circle.new(
      x: @x + @width,
      y: y,
      radius: 2.5,
      color: "gray",
    )
    Circle.new(
      x: @x,
      y: y + @height,
      radius: 2.5,
      color: "gray",
    )
    Circle.new(
      x: @x + @width,
      y: y + @height,
      radius: 2.5,
      color: "gray",
    )

    Rectangle.new(
      x: @x,
      y: @y,
      width: @width,
      height: @height,
      color: @background,
    )
  end
end
