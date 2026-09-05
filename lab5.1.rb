code = [
  "int a = 25;",
  "int b = 075;",
  "int c = 0xFF;",
  "int d = 100;",
  "int e = 0123;",
  "int f = 0x1A;"
]

code.each do |line| # кожен елемент масив в line 
  # Шістнадцяткові числа
  line = line.gsub(/\b0[xX][0-9a-fA-F]+\b/, "hexagonal") #gsub заміна тексту 

  # Вісімкові числа
  line = line.gsub(/\b0[0-7]+\b/, "octagonal")

  # Десяткові числа
  line = line.gsub(/\b\d+\b/, "decimal")

  puts line
end
