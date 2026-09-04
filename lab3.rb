# Лабораторна робота: Масиви. Первинна обробка

n = 12

# безалкогольні замовлення
ba = [3, 6, 11, 5, 6, 7, 6, 5]

# алкогольні замовлення
al = [10, 6, 9, 5, 6, 9, 5]

# 1. Загальний список та загальна кількість замовлень
vsi_zamovlennia = ba + al

puts "1. Загальний список замовлень:"
p vsi_zamovlennia
puts "Загальна кількість замовлень = #{vsi_zamovlennia.length}"

# 2. Список та кількість клієнтів, що сьогодні відвідали кафе
vidviduvaly = vsi_zamovlennia.uniq

puts "\n2. Клієнти, які сьогодні відвідали кафе:"
p vidviduvaly
puts "Кількість клієнтів = #{vidviduvaly.length}"

# 3. Кількість безалкогольних замовлень
puts "\n3. Кількість безалкогольних замовлень = #{ba.length}"

# 4. Клієнти, які робили безалкогольні замовлення
bezalko_kliienty = ba.uniq

puts "\n4. Клієнти, які робили безалкогольні замовлення:"
p bezalko_kliienty
puts "Кількість клієнтів = #{bezalko_kliienty.length}"

# 5. Кількість алкогольних замовлень
puts "\n5. Кількість алкогольних замовлень = #{al.length}"

# 6. Клієнти, які робили алкогольні замовлення
alko_kliienty = al.uniq

puts "\n6. Клієнти, які робили алкогольні замовлення:"
p alko_kliienty
puts "Кількість клієнтів = #{alko_kliienty.length}"

# 7. Клієнти, які робили обидва типи замовлень
obydva = bezalko_kliienty & alko_kliienty

puts "\n7. Клієнти, які робили обидва типи замовлень:"
p obydva
puts "Кількість клієнтів = #{obydva.length}"

# 8. Постійні клієнти, які сьогодні не відвідували кафе
usi_kliienty = (1..n).to_a
ne_vidviduvaly = usi_kliienty - vidviduvaly

puts "\n8. Клієнти, які сьогодні не відвідували кафе:"
p ne_vidviduvaly
puts "Кількість клієнтів = #{ne_vidviduvaly.length}"
