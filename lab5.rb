# 1. Введення текстового рядка
puts "Введіть текстовий рядок (або натисніть Enter для використання дефолтного):"
input_text = gets.chomp

# Якщо користувач нічого не ввів, використовуємо тестовий рядок
text = input_text.empty? ? "Hello World2026 ruby3 Programming AI100 lab Test" : input_text

puts "\n" + "="*40
puts "Початковий текст: \"#{text}\""
puts "="*40

# 2. Визначити розмір рядка
string_size = text.length
puts "\n2. Розмір рядка: #{string_size} символів"

# 3. Визначити кількість заголовних букв, прописних букв та цифр у суцільному рядку
uppercase_count = text.scan(/[A-Z]/).size
lowercase_count = text.scan(/[a-z]/).size
digits_count = text.scan(/[0-9]/).size

puts "\n3. Статистика символів:"
puts "   - Заголовні (великі) букви: #{uppercase_count}"
puts "   - Прописні (малі) букви:    #{lowercase_count}"
puts "   - Цифри:                    #{digits_count}"

# 4. Розбити текст на масив слів
words = text.split
puts "\n4. Масив слів:"
p words

# 5. Впорядкувати масив слів за зростанням довжини
sorted_by_length_asc = words.sort_by(&:length)
puts "\n5. Слова за зростанням довжини:"
p sorted_by_length_asc

# 6. Перетворити кожне слово у заголовне (перша буква — заголовна, решта — прописні)
capitalized_words = words.map(&:capitalize)
puts "\n6. Слова, перетворені у заголовні:"
p capitalized_words

# 7. Відобразити слова, підозрілі на абревіатуру (містять і букви, і цифри)
abbreviations = words.select { |word| word.match?(/[a-zA-Z]/) && word.match?(/\d/) }
puts "\n7. Слова, підозрілі на абревіатуру (містять і букви, і цифри):"
p abbreviations

# 8. Створити новий текст, у якому слова розміщені у порядку спадання довжини
new_text = words.sort_by(&:length).reverse.join(' ')
puts "\n8. Новий текст (слова у порядку спадання довжини):"
puts "\"#{new_text}\""
