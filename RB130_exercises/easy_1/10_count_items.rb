def count(arr)
  true_count = 0

  arr.each do |el|
    true_count += 1 if yield(el)
  end

  true_count
end

# further exploration
# def count(arr)
#   arr.select { |el| yield(el) }.size
# end

# def count(arr)
#   arr.map { |el| yield(el) ? 1 : 0 }.sum
# end


p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2