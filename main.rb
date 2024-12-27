require "ruby2d"

require_relative "src/mouse_handler"
require_relative "src/2d/element_group"
require_relative "src/elements/card"
require_relative "src/elements/bar"

set width: 1280, height: 720
set title: "Test", fullscreen: true

on :mouse do |event|
  MouseHandler.handle(event)
end

show_text = false

default_view = ElementGroup.new(0, 0, 1280, 750).push(
  # cards layer
  ElementGroup.new(0, 570, 1280, 150).push(
    Card.new(10, 600, 75, 100)
        .on("mouse_down", lambda { show_text = !show_text }),
    Card.new(70, 600, 75, 100),
    Card.new(130, 600, 75, 100),
    Card.new(190, 600, 75, 100),
  ),
  # inventory layer
  ElementGroup.new(830, 75, 450, 495),
  # hud layer
  ElementGroup.new(0, 0, 1280, 75)
    .push(
      Bar.new(10, 20, 600, 35).rtl!(true),
      Bar.new(670, 20, 600, 35),
    ),
)

last_frames = 0
frames = 0
last_fps = 0
update do
  # CLEAR>>>
  default_view.hide
  clear
  # <<<CLEAR

  Image.new(
    'background.png',
    x: 0, y: 0,
    width: 1280, height: 720,
    z: 0,
  )
  default_view.render

  frames += 1

  Text.new(
    "#{last_fps}/60",
    x: 10, y: 10,
    size: 12,
    color: "red",
  )

  if show_text
    Text.new(
      "You just clicked the card! Woah!",
      x: 10, y: 300,
      size: 24,
      color: 'white',
    )
  end

  wait_frames = Process.clock_gettime(Process::CLOCK_MONOTONIC) - last_frames
  if wait_frames >= 1
    last_fps = frames
    frames = 0
    last_frames = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end

show
