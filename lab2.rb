# Лабораторна робота №2: Розгалуження
# Обчислення комерційної вартості квартири

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

puts "Введіть метраж квартири (кв.м):"
ploshcha = gets.chomp.to_f

puts "Введіть матеріал (1-бетон / 2-цегла / 3-композит):"
material = gets.chomp.downcase
material = case material
           when "1" then "бетон"
           when "2" then "цегла"
           when "3" then "композит"
           else material
           end

puts "Введіть поверх:"
poverh = gets.chomp.to_i

puts "Введіть район (1-центр / 2-спальний / 3-приміський):"
raion = gets.chomp.downcase
raion = case raion
        when "1" then "центр"
        when "2" then "спальний"
        when "3" then "приміський"
        else raion
        end

puts "Введіть стиль (1-хайтех / 2-ексклюзів / 3-індивідуал / 4-стандарт):"
styl = gets.chomp.downcase
styl = case styl
       when "1" then "хайтех"
       when "2" then "ексклюзів"
       when "3" then "індивідуал"
       when "4" then "стандарт"
       else styl
       end

puts "Введіть категорію (1-елітна / 2-бюджетна / 3-пільгова):"
kategoria = gets.chomp.downcase
kategoria = case kategoria
            when "1" then "елітна"
            when "2" then "бюджетна"
            when "3" then "пільгова"
            else kategoria
            end

# --- Собівартість ---
# використовуємо case..when
indeks_materialiv =
  case material
  when "бетон"
    300
  when "цегла"
    500
  when "композит"
    800
  else
    0
  end

sv = ploshcha * indeks_materialiv

# --- Коефіцієнт поверху ---
# використовуємо if..elsif..else
if (poverh == 1 || poverh == 2 || poverh >= 8)
  koef_poverh = 1.1
elsif (poverh >= 3 && poverh <= 7)
  koef_poverh = 1.4
else
  koef_poverh = 0
end

# --- Коефіцієнт району ---
# використовуємо case..when
koef_raion =
  case raion
  when "центр"
    1.7
  when "спальний"
    1.4
  when "приміський"
    1.15
  else
    0
  end

rm = sv * koef_poverh * koef_raion

# --- Коефіцієнт архітектурного стилю ---
# використовуємо unless..else (одна з "різних форм" умовних операторів)
arh = 0
unless styl != "хайтех"
  arh = 2
else
  if styl == "ексклюзів"
    arh = 1.7
  elsif styl == "індивідуал"
    arh = 1.5
  elsif styl == "стандарт"
    arh = 1.05
  end
end

pz = rm * arh

# --- Коефіцієнт категорії ---
# використовуємо тернарний оператор
ktg = kategoria == "елітна" ? 1.75 : (kategoria == "бюджетна" ? 1.5 : (kategoria == "пільгова" ? 1.07 : 0))

zv = pz * ktg

puts "\n--- Результати ---"
puts "Собівартість (СВ): %.2f" % sv
puts "Вартість забудовника (ПЗ): %.2f" % pz
puts "Загальна вартість квартири (ЗВ): %.2f" % zv
