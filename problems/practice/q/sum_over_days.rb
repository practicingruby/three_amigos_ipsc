tests = ARGF.gets.to_i
tests.times do
  ARGF.gets  # throw away blank line
  n, d = ARGF.gets.scan(/\d+/).map { |n| n.to_i }
  ary  = ARGF.gets.scan(/\d+/).map { |n| n.to_i }
  
  # solution goes here...
end