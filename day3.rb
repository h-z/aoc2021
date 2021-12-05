file = File.open('input3.txt')

xs = file.readlines.map(&:chomp).map(&:chars).map{ |l| l.map(&:to_i) }

gs = xs.transpose.map { |x| x.group_by(&:itself).max_by { |_, v| v.count }.first }.join
g = gs.to_i(2)
e = g ^ (2**gs.size - 1)

pp e * g

# Part 2

def f(xss, index, default, direction = 1)
  bs = xss.map { |x| x[index] }.group_by(&:itself).to_h { |k, v| [k,v.count] }

  case bs[0] <=> bs[1]
  when -1 * direction
    1
  when 0
    default
  when 1 * direction
    0
  end
end

def f2(xs, default, direction)
  as = xs.dup
  as[0].size.times do |i|
    break if as.size == 1

    b = f(as, i, default, direction)
    as.select! { |a| a[i] == b }
  end
  as.flatten.join.to_i(2)
end

pp f2(xs, 1, 1) * f2(xs, 0, -1)

