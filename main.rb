require_relative 'lib/sheep_dog'

puts "Please enter inputs for the sheep-dogs (EOF is produced by pressing Ctrl+D on Unix or Ctrl+Z on Windows):"
inputs = $stdin.read
inputs = inputs.split(/\n/)
paddock = {}
sheep_dogs = []
sheep_dog_moves = []

# Validate and initialize input
inputs.each_with_index do |input, index|
  if index == 0
    if input =~ /^(\d)\s(\d)\s*$/ && $1 && $2
      paddock = {x: $1, y: $2}
      next
    else
      raise "Invalid input for paddock"
    end
  end
  if index.odd?
    if input =~ /^(\d)\s(\d)\s([NESW])\s*$/ && $1 && $2 && $3
      sheep_dogs << SheepDog.new($1, $2, $3, paddock)
    else
      raise "Invalid input for sheep-dog's position"
    end
  else
    if input =~ /^([A-Z]+)\s*$/ && $1
      sheep_dog_moves << $1
    else
      raise "Invalid input for sheep-dog's move"
    end
  end
end

# sheep-dog moves
sheep_dog_positions = []
sheep_dogs.each_with_index do |sheep_dog, index|
  sheep_dog_positions << sheep_dog.move(sheep_dog_moves[index])
end

# Validate sheep-dog moves
sheep_dog_moves.each_with_index do |move, index|
  step = 0
  move.each_char do |char|
    if char != "M"
      step += 1
      next
    else
      positions = []
      sheep_dog_positions.each do |sheep_dog_position|
        positions << sheep_dog_position[step]
      end
      raise "Stop bumping to each other you silly sheep-dog" if positions.size != positions.uniq.size
      step += 1
    end
  end
end

# Output
sheep_dogs.each do |sheep_dog|
  puts %(#{sheep_dog.x} #{sheep_dog.y} #{sheep_dog.face})
end
