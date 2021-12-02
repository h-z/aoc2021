file = File.open('input2.txt')

xs = file.readlines.map(&:chomp).map(&:split)

ys = xs.group_by(&:first)
get = ->(s) { ys[s].map { |_, x| x.to_i }.sum }
pp get['forward'] * (get['down'] - get['up'])


h = 0
d = 0
aim = 0

xs.each do |x|
  case x[0]
  when 'up'
    aim -= x[1].to_i
  when 'down'
    aim += x[1].to_i
  when 'forward'
    h += x[1].to_i
    d += aim * x[1].to_i
  end
end

pp d * h
