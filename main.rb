require "ruby2d"
require_relative "src/elements/card"
require_relative "src/mouse_handler"

set width: 1280, height: 720
set title: "Test", fullscreen: true

on :mouse do |event|
  MouseHandler.handle(event)
end

show_text = false
cards = [
  Card.new(10, 600, 75, 100)
    .on("mouse_down", lambda { show_text = !show_text }),
  Card.new(70, 600, 75, 100),
  Card.new(130, 600, 75, 100),
  Card.new(190, 600, 75, 100),
]

last_frames = 0
frames = 0
last_fps = 0
update do
  clear

  cards.map do |card|
    card.render
  end

  frames += 1

  Text.new(
    "#{last_fps}/60",
    x: 10, y: 10,
    size: 12,
    color: "white",
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
