def coefficients(size)
  counts = (0...(size / 2.0).ceil).map { |i| (i + 1) * size - i ** 2 - i }
  size % 2 == 0 ? counts + counts.reverse : counts + counts[0..-2].reverse
end

tests = ARGF.gets.to_i
tests.times do
  ARGF.gets  # throw away blank line
  n, d = ARGF.gets.scan(/\d+/).map { |n| n.to_i }
  ary  = ARGF.gets.scan(/\d+/).map { |n| n.to_i }
  
  # solution goes here...
end