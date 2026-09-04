# Лабораторна робота №4: Масиви. Робота з циклами

n = 12

# безалкогольні замовлення
ba = [3, 6, 11, 5, 6, 7, 6, 5]

# алкогольні замовлення
al = [10, 6, 9, 5, 6, 9, 5]


# 1. Загальний список та загальна кількість замовлень

vsi_zamovlennia = []

for x in ba
  vsi_zamovlennia << x
end

for x in al
  vsi_zamovlennia << x
end

puts "1. Загальний список замовлень:"
p vsi_zamovlennia
puts "Загальна кількість замовлень = #{vsi_zamovlennia.length}"


# 2. Список та кількість клієнтів, що сьогодні відвідали кафе

vidviduvaly = []

for x in vsi_zamovlennia
  if !vidviduvaly.include?(x)
    vidviduvaly << x
  end
end

puts "\n2. Клієнти, які сьогодні відвідали кафе:"
p vidviduvaly
puts "Кількість клієнтів = #{vidviduvaly.length}"


# 3. Кількість безалкогольних замовлень

kilkist_ba = 0

for x in ba
  kilkist_ba += 1
end

puts "\n3. Кількість безалкогольних замовлень = #{kilkist_ba}"


# 4. Клієнти, які робили безалкогольні замовлення

bezalko_kliienty = []

for x in ba
  if !bezalko_kliienty.include?(x)
    bezalko_kliienty << x
  end
end

puts "\n4. Клієнти, які робили безалкогольні замовлення:"
p bezalko_kliienty
puts "Кількість клієнтів = #{bezalko_kliienty.length}"


# 5. Кількість алкогольних замовлень

kilkist_al = 0

for x in al
  kilkist_al += 1
end

puts "\n5. Кількість алкогольних замовлень = #{kilkist_al}"


# 6. Клієнти, які робили алкогольні замовлення

alko_kliienty = []

for x in al
  if !alko_kliienty.include?(x)
    alko_kliienty << x
  end
end

puts "\n6. Клієнти, які робили алкогольні замовлення:"
p alko_kliienty
puts "Кількість клієнтів = #{alko_kliienty.length}"


# 7. Клієнти, які робили обидва типи замовлень

obydva = []

for x in bezalko_kliienty
  if alko_kliienty.include?(x)
    obydva << x
  end
end

puts "\n7. Клієнти, які робили обидва типи замовлень:"
p obydva
puts "Кількість клієнтів = #{obydva.length}"


# 8. Постійні клієнти, які сьогодні не відвідували кафе

usi_kliienty = []

for x in 1..n
  usi_kliienty << x
end

ne_vidviduvaly = []

for x in usi_kliienty
  if !vidviduvaly.include?(x)
    ne_vidviduvaly << x
  end
end

puts "\n8. Клієнти, які сьогодні не відвідували кафе:"
p ne_vidviduvaly
puts "Кількість клієнтів = #{ne_vidviduvaly.length}"
