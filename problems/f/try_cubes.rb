cube_sets = [ [1, 2, 7, 9, 9] + [10] * 14,
              [1, 2, 5, 9, 9] + [10] * 14 ]

cube_sets.each do |cubes|
  open("| python f.py", "r+") do |python|
    python.puts cubes.size
    python.puts cubes.join(" ")
    python.close_write
    puts python.read
  end
end
