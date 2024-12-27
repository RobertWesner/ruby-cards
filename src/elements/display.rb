# frozen_string_literal: true

class Display < Element
  def initialize(x, y, width, height, image)
    super(x, y, width, height)

    @image = image
  end

  def render
    super

    Image.new(
      @image,
      x: x, y: y,
      width: width, height: height,
    )
  end
end
