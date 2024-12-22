require "ruby2d"
require_relative "src/elements/card"
require_relative "src/mouse_handler"

set width: 1280, height: 720

mouse_handler = MouseHandler.new
on :mouse do |event|
  mouse_handler.handle(event)
end

mouse_handler.register!(
  Card.new(10, 10, 75, 100)
    .on("mouse_down", lambda {
      Text.new(
        'You just clicked the card! Woah!',
        x: 10, y: 300,
        size: 24,
        color: 'white',
      )
    }),
  Card.new(100, 10, 75, 100),
  Card.new(190, 10, 75, 100),
)

show




