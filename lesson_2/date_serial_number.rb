puts "Vvedite god"
year = gets.to_i
puts "Vvedite mesyac"
month = gets.to_i
puts "Vvedite day"
day = gets.to_i
days_of_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
days = 0
days_of_month[1] += 1 if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
days_of_month.each.with_index(1) { |amount, index| days += amount if index < month }
puts days + day
