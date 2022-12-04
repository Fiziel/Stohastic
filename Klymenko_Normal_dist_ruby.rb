while 1
arr = Array.new(2000){ |index| 0} 
counter_k = 0
counter_n = 0
si = 0 
sj = 0

while 1
  begin
    puts "\nВведіть кількість випробувань (Ns): "
    trials = Integer(STDIN.gets.chomp)
    break
  rescue ArgumentError
    puts "Введено не ціле значення. Спробуйте ще раз."
  end
end

while 1
  begin
    puts "\nВведіть кількість одночасних підкидань: "
    cr = Integer(STDIN.gets.chomp)
    break
  rescue ArgumentError
    puts "Введено не ціле значення. Спробуйте ще раз."
  end
end

while 1
  begin
    puts "\nВведіть кількість граней кубика: "
    facets = Integer(STDIN.gets.chomp)
    break
  rescue ArgumentError
    puts "Введено не ціле значення. Спробуйте ще раз."
  end
end

while 1
  begin
    counter_k = counter_k + 1
    s = 0
    for i in 1..cr
      x = (facets * rand()) + 1
      s = s + x
    end
    arr[s] = arr[s] + 1    
    break if (trials == counter_k) 
  end
end 

for i in (cr..facets*cr)
    si = si + i
end
sa = si / (facets * cr - cr)
for i in (cr..facets*cr)
    next if (arr[i] == 0) 
      counter_n = counter_n + 1
      sj = sj + (i - sa) ** 2
end

sd = Math.sqrt((sj/3) / (facets * cr - cr))

puts "\nКількість спроб: #{counter_k} \n\nСереднє значення: #{sa} \n\nСередньоквадратичне відхилення: #{sd}\n\nДисперсія: #{sd*sd}\n\nКількість ненульових значень: #{counter_n}"

# Розрахунок нормальної функції
#for i in (0..facets*cr)
#    g = Math.exp((sa - i) * (i - sa) / (2 * sd * sd)) / (sd * Math.sqrt(2 * 3.1415926))
#    puts g
#end

end