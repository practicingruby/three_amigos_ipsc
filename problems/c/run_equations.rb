tests = ARGF.gets.to_i
tests.times do
  ARGF.gets  # discard blank line
  
  expressions = ARGF.gets.to_i
  
  cells = { }
  expressions.times do
    expression = ARGF.gets
    if expression[/\A\s*(\S+)\s*=\s*(\S.+?)\s*\z/]
      cells[$1] = $2
    end
  end
  until cells.values.all? { |n| n.is_a? Numeric }
    cells.each do |cell, expression|
      next if expression.is_a? Numeric
      expression.gsub!(/\b[A-Za-z]+\d+\b/) { |ref|
        cells[ref].is_a?(Numeric) ? cells[ref] : ref
      }
      eval("cells['#{cell}'] = #{expression}") rescue next
    end
  end
  cells.sort.each do |cell, value|
    puts "#{cell} = #{value}"
  end
  puts
end
