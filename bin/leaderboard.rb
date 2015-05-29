require_relative '../lib/all'
require_relative '../lib/leaderboard'


@names_array = []
@counter = 0
@wins_array = []
@loss_array = []
names = Leaderboard.group(:name).limit(10).sum(:win_count)
wins = Leaderboard.group(:name).sum(:win_count)
losses = Leaderboard.group(:name).sum(:loss_count)


names.each do |name, win|
  @names_array << name
end
@border_length = (@names_array.max_by(&:length).length - 6)

wins.each do |name, win|
  @wins_array << win
end

losses.each do |name, loss|
  @loss_array << loss
end

puts "-" * (@border_length + 28)
puts ": Player #{" " * @border_length}:  Wins  : Losses :"
puts "-" * (@border_length + 28)
until @counter == @names_array.length
  space = @names_array.max_by(&:length).length - @names_array[@counter].length
  puts ": #{@names_array[@counter]}#{" " * space} :    #{@wins_array[@counter]}   :    #{@loss_array[@counter]}   :"
  puts "-" * (@border_length + 28)
  @counter += 1
end


