korzina = {}
loop do
  puts "Vvedite nazvanie tovara"
  tovar_name = gets.chomp
  break if tovar_name == 'stop'
  puts "Vvedite cenu tovara"
  cena = gets.to_f
  puts "Vvedite kolichestvo kuplennogo tovara"
  kolichestvo =  gets.to_f
  korzina[tovar_name] = { price: cena, quantity: kolichestvo }
end
puts korzina
cena_tovara = 0
total_amount = 0
korzina.each.with_index(1) do |(name, value_hash), index|
  cena_tovara += value_hash[:price] * value_hash[:quantity]
  puts "#{index} #{name} - kuplenno na summu #{cena_tovara}"
  total_amount += cena_tovara
end
puts "Obsh'aya stoimost' pokupki: **#{total_amount}**"
