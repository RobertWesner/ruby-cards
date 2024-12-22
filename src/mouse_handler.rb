class MouseHandler
  def initialize
    @elements = []
  end

  def register!(*elements)
    @elements.push(*elements)
  end

  def handle(event)
    x = event.x
    y = event.y

    @elements.each do |element|
      if x > element.x && x < element.x + element.width &&
        y > element.y && y < element.y + element.height
        if event.type == :move
          element.on_mouse_move(x, y, event.button)

          unless element.mouse_entered
            element.mouse_entered = true
            element.on_mouse_enter(x, y, event.button)
          end
        end
        if event.type == :up
          element.on_mouse_up(x, y, event.button)
        end
        if event.type == :down
          element.on_mouse_down(x, y, event.button)
        end
      elsif element.mouse_entered
        element.mouse_entered = false
        element.on_mouse_leave(x, y, event.button)
      end
    end
  end
end
