a = '1 2020 1213'
case a
when 'pk'
  puts 'pk'
when b = /(\d+) (\d+) (\d+)/
  puts b
  puts 'num'
else
  puts 'else'
end