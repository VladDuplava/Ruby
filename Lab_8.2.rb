class Mark
  attr_reader :subject, :value

  def initialize(subject, value)
    @subject = subject
    @value = value
  end

  def to_s
    "#{subject} : #{value}"
  end
end

class Student
  attr_reader :marks, :name

  def initialize(name)
    @name = name
    @marks = []
  end

  # чи вже є предмет з такою назвою у студента
  def exists?(subject_title)
    @marks.any? { |m| m.subject == subject_title }
  end

  # додає оцінку, тільки якщо такого предмету ще немає
  def add_mark(mark)
    @marks << mark unless exists?(mark.subject)
  end

  def to_s
    "#{name}: [#{marks.map(&:to_s).join(', ')}]"
  end
end

class RetakeStudent < Student
  # якщо предмет вже є - стара оцінка замінюється новою
  def add_mark(mark)
    @marks.reject! { |m| m.subject == mark.subject }
    @marks << mark
  end
end

if __FILE__ == $PROGRAM_NAME
  mark = Mark.new('C++', 5)
  puts mark # => C++ : 5

  mark2 = Mark.new('C++', 3)

  ret = RetakeStudent.new('Other student')
  ret.add_mark(mark)   
  ret.add_mark(mark2)  
  puts ret
end
