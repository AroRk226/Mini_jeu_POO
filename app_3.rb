require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# ----------------

puts "    *******************************************************"
puts "    **   BIENVENUE SUR 'ILS VEULENT TOUS MA POO' !!!!!   **"
puts "    **   Le but du jeu est d'être le dernier survivant   **"
puts "    *******************************************************"


my_game = Game.new("Kira")

while my_game.is_still_ongoing?
  my_game.menu_choice
  my_game.enemies_attack
end

binding.pry