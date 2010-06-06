def solve(n, c1, g1, c2, g2)
  winner   = "DRAGON"
  s1_delta = c1 - g1
  s2_delta = c2 - g2
  0.upto(n) do |a|
    last = nil
    0.upto(n) do |b|
      eqs = [ a * s1_delta + b * s2_delta - n + c1,
              a * s1_delta + b * s2_delta - n + c2 ]
      if eqs.any? { |eq| eq == 0 }
        return "PRINCE"
      elsif eqs.any? { |eq| eq == 1 }
        winner = "DRAW"
      end
      break if last and last.first.abs < eqs.first.abs and
                        last.last.abs  < eqs.last.abs
      last = eqs
    end
  end
  winner
end

tests = ARGF.gets.to_i
tests.times do
  ARGF.gets  # discard blank line
  
  n, c1, g1, c2, g2 = ARGF.gets.split.map { |n| n.to_i }
  
  puts solve(n, c1, g1, c2, g2)
end
