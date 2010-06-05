def process(file)
  File.open(file) do |f|
     n = Integer(f.gets.chomp)
     n.times do
       f.gets
       a,b,c,d = f.gets.chomp.split(/ /).map { |e| Integer(e) }
       puts optimize(a,b,c,d)
     end
  end
end

def optimize(a, b, c, d)
  a,b,c = [a,b,c].sort

  case
  when d <= c-b
    a*b*(c-d)
  when d <= (c - a) + (b - a)
    delta_b = (d-(c-b)) / 2
    delta_c = d - delta_b

    a * (b-delta_b) * (c-delta_c)
  else
    x = (d-(b-a)-(c-a)) 

    delta_a = x / 3
    delta_b = (b-a) + delta_a
    delta_c = (c-a) + delta_a 

    case x % 3
    when 0
      (a-delta_a)*(b-delta_b)*(c-delta_c)
    when 1
      (a-delta_a)*(b-delta_b)*(c-delta_c-1)
    when 2
      (a-delta_a)*(b-delta_b-1)*(c-delta_c-1)
    end
  end
end

process("p2.in")
