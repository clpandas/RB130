def max_by(arr)
  max = arr.first

  arr.each do |el|
    max = el if yield(el) > yield(max)
  end
  max
end

# solution with `reduce`
# def max_by(arr)
#   arr.reduce { |max, el| yield(max) < yield(el) ? el : max }
# end

# LS solution
# def max_by(arr)
#   return nil if arr.empty?

#   max_element = arr.first
#   largest = yield(max_element)

#   arr[1..-1].each do |el|
#     yielded_val = yield(el)
#     if largest < yielded_val
#       largest = yielded_val
#       max_element = el
#     end
#   end

#   max_element
# end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil