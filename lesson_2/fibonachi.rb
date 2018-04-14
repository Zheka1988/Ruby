fibonachi = [0, 1]
element = 1
while element < 100
  fibonachi.push(element)
  element = fibonachi[-1] + fibonachi[-2]
end
puts fibonachi
