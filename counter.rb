p "Enter the filename:"
filename = gets.chomp

text = open(filename)
words = text.read.split(" ")
frequencies = {}

words.each do |w|
  w = w.match(/[a-z0-9]+?'?-?[a-z0-9]+/).to_s
  w.strip!
  next if w.length == 0
  if frequencies[w]
    frequencies[w] += 1
  else
    frequencies[w] = 1
  end
end

count_array = frequencies.to_a
count_array.sort! {|x, y| y[1] <=> x[1]}
count_array.each do |a|
  puts a[0].to_s + "\t" + a[1].to_s
end
