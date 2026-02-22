=begin
in: two arrs, out: one arr with sub arrs from input arrs
- define result arr to build into
- iterate through first arr with an index
- take the first el of both arrs and push into result arr
- return result arr
=end

def zip(arr1, arr2)
  result = []
  arr1.each_with_index do |el, idx|
    result << [el, arr2[idx]]
  end

  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]