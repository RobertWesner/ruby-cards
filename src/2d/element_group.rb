require_relative "element"

class ElementGroup < Element
  def initialize(x, y, width, height)
    super

    @renders = []
  end

  def push(*elements)
    @renders.push(*elements)
    
    self
  end

  def render
    super

    @renders.each(&:render)
  end

  def hide
    super

    @renders.each(&:hide)
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
