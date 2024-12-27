module MouseHandler
  @elements = []

  def self.register!(*elements)
    @elements.push(*(elements.flatten))
  end

  def self.handle(event)
    x = event.x
    y = event.y

    fired = false
    @elements.reverse.each do |element|
      if element.listens_to_event? && element.rendered &&
        x > element.x && x < element.x + element.width &&
        y > element.y && y < element.y + element.height
        if event.type == :move && !fired
          fired = true
          element.on_mouse_move(x, y, event.button)

          unless element.mouse_entered
            element.mouse_entered = true
            element.on_mouse_enter(x, y, event.button)

            @elements.each do |other_element|
              if other_element != element && other_element.mouse_entered
                other_element.mouse_entered = false
                other_element.on_mouse_leave(x, y, event.button)
              end
            end
          end
        end
        if event.type == :up && !fired
          fired = true
          element.on_mouse_up(x, y, event.button)
        end
        if event.type == :down && !fired
          fired = true
          element.on_mouse_down(x, y, event.button)
        end
      elsif element.mouse_entered
        fired = true
        element.mouse_entered = false
        element.on_mouse_leave(x, y, event.button)
      end
    end
  end
end
