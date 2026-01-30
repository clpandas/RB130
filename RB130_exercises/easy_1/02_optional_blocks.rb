def compute
  return 'Does not compute.' unless block_given? 
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# futher exploration

def compute(arg)
  return 'Does not compute.' unless block_given? 
  yield(arg)
end

p compute('cat') { |arg| arg + 'a' + 'b' } == 'catab'
p compute(42) { |num| num + 5 + 3 } == 50
p compute('dog') == 'Does not compute.'