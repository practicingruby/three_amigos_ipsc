tests = ARGF.gets.to_i
puts tests
tests.times do
  2.times do
    ARGF.gets  # discard blank line and count
  end
  
  numbers = ARGF.gets.split.map { |n| n.to_i }
  
  loop do
    if numbers != numbers.sort and numbers != numbers.sort { |a, b| b <=> a }
      puts
      puts numbers.size
      puts numbers.join(" ")
      break
    end
    numbers = numbers.sort_by { rand }
  end
end
