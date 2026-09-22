class Author
  @@authors = []

  attr_reader :surname, :first_name, :patronymic

  def initialize(surname, first_name, patronymic = nil)
    if valid_name?(surname) && valid_name?(first_name) && (patronymic.nil? || valid_name?(patronymic))
      @surname = surname
      @first_name = first_name
      @patronymic = patronymic

      # додаємо в список, тільки якщо такого автора ще немає
      already_exists = @@authors.any? do |a|
        a.surname == surname && a.first_name == first_name && a.patronymic == patronymic
      end
      @@authors << self unless already_exists
    else
      raise ArgumentError, 'Некоректні дані автора'
    end
  end

  def self.authors
    @@authors
  end

  def to_s
    [surname, first_name, patronymic].compact.join(' ')
  end

  def valid_name?(str)
    return false unless str.is_a?(String)
    return false if str.length > 15 || str.length == 0

    str.match?(/\A[\p{L}\-]+\z/)
  end
end

class Book
  attr_reader :authors, :title, :publisher, :year

  def initialize(authors, title, publisher, year)
    if valid_authors?(authors) && valid_text?(title) && valid_text?(publisher) && valid_year?(year)
      @authors = authors
      @title = title
      @publisher = publisher
      @year = year
    else
      @authors = nil
      @title = nil
      @publisher = nil
      @year = nil
    end
  end

  def valid_authors?(authors)
    return false unless authors.is_a?(Array) && !authors.empty?
    return false unless authors.all? { |a| a.is_a?(Author) }

    authors.uniq.size == authors.size
  end

  def valid_text?(str)
    str.is_a?(String) && str.match?(/\A[\p{L}0-9\-.,;]+\z/)
  end

  def valid_year?(year)
    year.to_s.match?(/\A\d{4}\z/) && year.to_i <= Time.now.year
  end
end

if __FILE__ == $PROGRAM_NAME
  author1 = Author.new('Шевченко', 'Тарас')
  author2 = Author.new('Franko', 'Ivan', 'Yakovych')
  puts Author.authors.map(&:to_s)

  book = Book.new([author1, author2], 'Kobzar, tom 1', 'Dnipro', 1840)
  puts "#{book.title}, #{book.publisher}, #{book.year}"

  bad_book = Book.new([author1, author2], 'Kobzar', 'Dnipro', 3000) # рік > поточного
  puts bad_book.title.inspect # => nil
end
