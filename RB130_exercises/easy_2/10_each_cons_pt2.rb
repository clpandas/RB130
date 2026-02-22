def each_cons(arr, num)
  arr.each_index do |idx|
    break if idx + num - 1 >= arr.size
    yield(*arr[idx..(idx + num - 1)])      
  end

  nil
end

# solution with `while`
# def each_cons(arr, num)
#   count = 0

#   while count <= arr.size - num
#     yield(*arr[count, num])
#     count += 1
#   end
  
#   nil
# end

# solution with `upto`
# def each_cons(arr, num)
#   0.upto(arr.size - num) do |el|
#     yield(*arr[el, num])
#   end

#   nil
# end

# solutionw with `for`
# def each_cons(arr, num)
#   for idx in (0..(arr.size - num))
#     yield(*arr[idx, num])
#   end

#   nil
# end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}