def solve(n, c1, g1, c2, g2)
  winner   = "DRAGON"
  s1_delta = c1 - g1
  s2_delta = c2 - g2
  if s1_delta <= 0 and s2_delta <= 0
    case n
    when c1, c2 then         return "PRINCE"
    when c1 + 1, c2 + 1 then return "DRAW"
    else                     return "DRAGON"
    end
  end
  0.upto(10_000) do |a|
    0.upto(10_000) do |b|
      eqs = [ a * s1_delta + b * s2_delta - n + c1,
              a * s1_delta + b * s2_delta - n + c2 ]
      if eqs.any? { |eq| eq == 0 }
        return "PRINCE"
      elsif eqs.any? { |eq| eq == 1 }
        winner = "DRAW"
      end
    end
  end
  winner
end

tests = ARGF.gets.to_i
tests.times do
  ARGF.gets  # discard blank line
  
  n, c1, g1, c2, g2 = ARGF.gets.split.map { |n| n.to_i }
  
  puts solve(n, c1, g1, c2, g2)
  $stdout.flush
end
