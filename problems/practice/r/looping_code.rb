def add(x, y)
  result =  (x + y) % (2 ** 32)
  result -= 2 ** 32 if result >= 2 ** 31
  return result
end

def magic(x)
  foo = 0
  while x > 1
    y = 2
    loop do
      puts "x, y, foo = %p, %p, %p" % [x, y, foo]
      return foo <= 0 if y == x
      if magic(y) and x % y == 0
        x   /= y
        foo =  add(foo, 1)
        break
      end
      y += 1
    end
  end
end

where = ARGV.shift.to_i
step  = ARGV.shift.to_i
while step.nonzero?
  puts "where = %p" % where
  where = add(where, step)
  break if not magic(where)
end
