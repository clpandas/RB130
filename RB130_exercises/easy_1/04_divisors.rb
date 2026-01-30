=begin
p: return a list of all divisors of a positive integer
in: positive integer, out: array of integers that are divisors of input num

- define empty result arr
- iterate from 1 through input num
  - if the num can be evenly divided into the input num, push to result arr
- return result arr
=end

def divisors(num)
  result = []

  (1..num).each do |n|
    result << n if num % n == 0
  end

  result
end

# LS solution
# def divisors(number)
#   1.upto(number).select do |candidate|
#     number % candidate == 0
#   end
# end

# futher exploration
# def divisors(num)
#   result = []

#   (1..Math.sqrt(num)).each do |n|
#     if num % n == 0
#       result << n
#       result << num / n
#     end
#   end 

#   result.uniq.sort
# end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute