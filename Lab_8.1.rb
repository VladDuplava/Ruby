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

if __FILE__ == $PROGRAM_NAME
  mark = Mark.new('C++', 5)
  puts mark 

  st = Student.new('First student')
  st.add_mark(mark)
  puts st 

  mark2 = Mark.new('C++', 3)
  st.add_mark(mark2) # предмет вже є - не додається
  puts st 
end
