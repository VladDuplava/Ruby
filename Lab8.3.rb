class Pizza
  ALLOWED_DIAGONALS = [25, 50].freeze

  @@count = 0        # кількість успішно створених екземплярів
  @@fail_count = 0    # кількість невдалих спроб створення

  attr_reader :ingredients, :number, :d

  def initialize(d, ingredients)
    if ALLOWED_DIAGONALS.include?(d)
      @@count += 1
      @number = @@count
      @d = d
      @ingredients = ingredients
    else
      @@fail_count += 1
      @ingredients = []
      @number = 0
      @d = 0
    end
  end

  def self.failInstance
    @@fail_count
  end

  def to_s
    "Pizza ##{number}, d=#{d}, ingredients: #{ingredients}"
  end
end

if __FILE__ == $PROGRAM_NAME
  pizza1 = Pizza.new(10, %w[mushroom cheese])         # невдала спроба
  pizza2 = Pizza.new(25, %w[mushroom cheese cherry])  # ok, №1
  pizza3 = Pizza.new(50, %w[mushroom])                # ok, №2
  pizza4 = Pizza.new(100, %w[mushroom cheese cherry]) # невдала спроба

  puts pizza2
  puts pizza3
  puts Pizza.failInstance # => 2
end
