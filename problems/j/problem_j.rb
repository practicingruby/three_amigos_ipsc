def process(file)
  File.open(file) do |f|
    2.times { f.gets }

    until f.eof?
      list = list_for(f.gets.chomp.to_i)   
      if list.empty?
        puts "Impossible"
      else
        men, women = list
        puts men.join(" ")
        puts women.join(" ")
      end

      puts

      f.gets
    end
  end
end

def list_for(n)
  return [] if n.even?
  [(1..n).map { |k| a = 1 + k % n; a == 0 ? n : a },
   (1..n).map { |k| a = (n - 1 + k) % n; a == 0 ? n : a}]
end

process(ARGV[0])
