#task1
def process_goods(goods_array)
  goods_array.each_with_object({}) do |item, hash|
    name, count = item.split('-')
    key = name.strip.to_sym
    hash[key] = hash.fetch(key, 0) + count.to_i
  end
end

# Перевірка
data = ['Milk-10', 'Milk-20', 'Sugar-10']
puts process_goods(data)

#############################################################


#task2
def categorize_students(text, max_score, upper_bound, lower_bound)
  # 1. Обчислюємо мінімальні бали для категорій
  top_limit = max_score * (100 - upper_bound) / 100.0   # 100 * 0.9 = 90
  min_limit = max_score * lower_bound / 100.0            # 100 * 0.15 = 15

  # 2. Перетворюємо рядок на масив: [["Student1", 70], ["Student3", 80], ...]
  students = text.split('\\').map do |pair|
    name, score = pair.split(',')
    [name.strip, score.to_f]
  end

  # 3. Сортуємо: -score (від найбільшого), name (за алфавітом)
  students.sort_by! { |name, score| [-score, name] }

  # 4. Заповнюємо підсумковий хеш
  result = { top: [], middle: [], bottom: [] }

  students.each do |name, score|
    if score >= top_limit
      result[:top] << name
    elsif score >= min_limit
      result[:middle] << name
    else
      result[:bottom] << name
    end
  end

  result
end

# Перевірка
data = "Student1,70\\ Student3,80\\ Student2,80"
puts categorize_students(data, 100, 10, 15)
# Результат: {:top=>[], :middle=>["Student2", "Student3", "Student1"], :bottom=>[]}
