def step(start_val, end_val, step_val)
  loop do
    yield(start_val)
    start_val += step_val
    break if start_val > end_val
  end
end

# LS solution
# def step(start_point, end_point, increment)
#   current_value = start_point
#   loop do
#     yield(current_value)
#     break if current_value + increment > end_point
#     current_value += increment
#   end
#   current_value
# end

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

# LS solution is safer because it assigns the parameter to a new local variable rather than letting the method change the given arguments directly
# LS solution offers a more useful return value because it returns the last yielded value instead of nil