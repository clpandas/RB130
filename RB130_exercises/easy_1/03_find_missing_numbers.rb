=begin
p: given a sorted array of integers, return an array that includes all missing integers (in order) between first and last elements of the argument
in: sorted arr of ints, out: sorted arr of ints that are missing from input arr
- define a result arr to build into
- create a range from the first to the last element
- iterate through that range
  - if the num is in the input arr skip
  - elsif num is not input arr push to result arr
- return result arr
=end

def missing(sorted_arr)
  return [] if sorted_arr.size == 1

  first = sorted_arr.first
  last = sorted_arr.last

  result_arr = []
  (first..last).each do |num|
    result_arr << num unless sorted_arr.include?(num)
  end

  result_arr
end

# LS solution
# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []