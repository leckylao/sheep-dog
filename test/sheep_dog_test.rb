require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/sheep_dog'

describe SheepDog do
  it 'can move L correctly' do
    sheep_dog = SheepDog.new("1", "1", "N", {x: "5", y: "5"})
    sheep_dog.move("L")
    sheep_dog.face.must_equal "W"

    sheep_dog = SheepDog.new("1", "1", "W", {x: "5", y: "5"})
    sheep_dog.move("L")
    sheep_dog.face.must_equal "S"

    sheep_dog = SheepDog.new("1", "1", "S", {x: "5", y: "5"})
    sheep_dog.move("L")
    sheep_dog.face.must_equal "E"

    sheep_dog = SheepDog.new("1", "1", "E", {x: "5", y: "5"})
    sheep_dog.move("L")
    sheep_dog.face.must_equal "N"
  end

  it 'can move R correctly' do
    sheep_dog = SheepDog.new("1", "1", "N", {x: "5", y: "5"})
    sheep_dog.move("R")
    sheep_dog.face.must_equal "E"

    sheep_dog = SheepDog.new("1", "1", "W", {x: "5", y: "5"})
    sheep_dog.move("R")
    sheep_dog.face.must_equal "N"

    sheep_dog = SheepDog.new("1", "1", "S", {x: "5", y: "5"})
    sheep_dog.move("R")
    sheep_dog.face.must_equal "W"

    sheep_dog = SheepDog.new("1", "1", "E", {x: "5", y: "5"})
    sheep_dog.move("R")
    sheep_dog.face.must_equal "S"
  end

  it 'can move M correctly' do
    sheep_dog = SheepDog.new("1", "1", "E", {x: "5", y: "5"})
    sheep_dog.move("M")
    sheep_dog.positions.must_equal [{x: 1, y: 1}, {x: 2, y: 1}]

    sheep_dog = SheepDog.new("1", "1", "S", {x: "5", y: "5"})
    sheep_dog.move("M")
    sheep_dog.positions.must_equal [{x: 1, y: 1}, {x: 1, y: 0}]

    sheep_dog = SheepDog.new("1", "1", "W", {x: "5", y: "5"})
    sheep_dog.move("M")
    sheep_dog.positions.must_equal [{x: 1, y: 1}, {x: 0, y: 1}]

    sheep_dog = SheepDog.new("1", "1", "N", {x: "5", y: "5"})
    sheep_dog.move("M")
    sheep_dog.positions.must_equal [{x: 1, y: 1}, {x: 1, y: 2}]

    # Should raise error when hitting boundary
    sheep_dog = SheepDog.new("5", "5", "N", {x: "5", y: "5"})
    lambda {sheep_dog.move("M")}.must_raise(RuntimeError, "Stop bumping into the paddock you silly sheep-dog!")

    sheep_dog = SheepDog.new("5", "5", "E", {x: "5", y: "5"})
    lambda {sheep_dog.move("M")}.must_raise(RuntimeError, "Stop bumping into the paddock you silly sheep-dog!")

    sheep_dog = SheepDog.new("0", "0", "W", {x: "5", y: "5"})
    lambda {sheep_dog.move("M")}.must_raise(RuntimeError, "Stop bumping into the paddock you silly sheep-dog!")

    sheep_dog = SheepDog.new("0", "0", "S", {x: "5", y: "5"})
    lambda {sheep_dog.move("M")}.must_raise(RuntimeError, "Stop bumping into the paddock you silly sheep-dog!")
  end
end
