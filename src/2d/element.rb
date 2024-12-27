class Element
  attr_accessor :x, :y, :width, :rendered, :height, :mouse_entered

  def initialize(x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
    @mouse_entered = false
    @handlers = {
      "mouse_down" => [],
      "mouse_up" => [],
      "mouse_move" => [],
      "mouse_enter" => [],
      "mouse_leave" => [],
    }
    @rendered = false
    @renders = []

    MouseHandler.register!(self)
  end

  def listens_to_event?
    false
  end

  def render
    @rendered = true
  end

  def hide
    @rendered = false
  end

  def on_mouse_down(x, y, button)
    @handlers["mouse_down"].each do |handler|
      handler.call
    end
  end

  def on_mouse_up(x, y, button)
    @handlers["mouse_up"].each do |handler|
      handler.call
    end
  end

  def on_mouse_move(x, y, button)
    @handlers["mouse_move"].each do |handler|
      handler.call
    end
  end

  def on_mouse_enter(x, y, button)
    @handlers["mouse_enter"].each do |handler|
      handler.call
    end
  end

  def on_mouse_leave(x, y, button)
    @handlers["mouse_leave"].each do |handler|
      handler.call
    end
  end

  def on(event, call)
    @handlers[event].push(call)

    self
  end
end
