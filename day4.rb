file = File.open('input4.txt')

xs = file.readlines

numbers = xs.shift.split(',').map(&:to_i)
xs.shift
xs.pop
bi = 0
boards = [[]]

xs.each do |line|
  if line == "\n"
    bi += 1
    boards[bi] = []
  else
    boards[bi] << line.split.map(&:to_i)
  end
end

winner_boards = {}

numbers.each do |number|
  boards.each.with_index do |board, index|
    board.each do |line|
      i = line.index(number)
      line[i] = nil if i
    end

    if board.any? { |line| line.compact.empty? } || board.transpose.any? { |line| line.compact.empty? }
      unless winner_boards.keys.include?(index)
        winner_boards[index] = board.flatten.compact.sum * number
      end
    end
  end
end

pp winner_boards.values.first
pp winner_boards.values.last
