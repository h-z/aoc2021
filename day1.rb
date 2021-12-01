file = File.open('input1.txt')

xs = file.readlines.map(&:chomp).map(&:to_i)

pp xs.each_cons(1).map(&:sum).each_cons(2).count {|x| x.last > x.first }
pp xs.each_cons(3).map(&:sum).each_cons(2).count {|x| x.last > x.first }

