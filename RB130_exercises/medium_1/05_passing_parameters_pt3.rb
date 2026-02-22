items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*beginning, last|
  puts "#{beginning.join(', ')}"
  puts "#{last}"
end

# Corresponding output:
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first, *middle, last|
  puts "#{first}"
  puts "#{middle.join(', ')}"
  puts "#{last}"
end

# Corrosponding output:
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

gather(items) do |first, *ending|
  puts "#{first}"
  puts "#{ending.join(', ')}"
end

# Corrosponding output:
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |*beginning, last|
  puts "#{beginning.join(', ')}, and #{last}"
end

# Corrosponding output: 
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

# LS solution has more descriptive names for block parameters