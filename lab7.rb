
# Task 1 
def sum
  s = yield(4) + yield(0) + yield(-12)
  s
end

resul1t = sum { |n| n < 0 ? n * n : n }

puts "resul1t = #{resul1t}"


#  Task 2 
def check_password(login, password)
  Proc.new { |l, p| l == login and p == password }
end

admin = check_password("u1", "p1")

puts admin.call("u1", "p1")   # true
puts admin.call("u")          # false (другий аргумент не переданий)
