# frozen_string_literal: true

class ElementGroup < Element
  def initialize(x, y, width, height)
    super

    @elements = []
  end

  def push(*elements)
    @elements.push(*elements)
    
    self
  end

  def render
    @elements.each(&:render)
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
