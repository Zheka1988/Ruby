hash = {}
alphabet = ('a'..'z').to_a
glasnie = ['a', 'e', 'i', 'o', 'u', 'y']
alphabet.each.with_index(1) { |bukva, index| hash[bukva] = index  if glasnie.include?(bukva) }
puts hash
