require_relative 'lib/console_interface'
require_relative 'lib/game'
require 'colorize'

puts 'Приветствуем в консольной версии виселицы! Отгадайте слово.'

word = File.readlines("#{__dir__}/data/words.txt", chomp: true).sample
game = Game.new(word)
console_interface = ConsoleInterface.new(game)

until game.over?
  console_interface.print_out
  letter = game.normalized_letter(console_interface.get_input)
  game.play!(letter)
end

console_interface.print_out
