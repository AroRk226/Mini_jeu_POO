require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 && player2.life_points > 0 

puts ""
puts "			Voici l'état de chaque joueur 			"
puts "#{player1.show_state}"
puts "#{player2.show_state}"
puts "			Passons à la phase d'attaque 			"
puts player1.attacks(player2)
puts player2.show_state
	if player2.life_points <= 0
		puts "#{player2.name} a été tué par #{player1.name}"
		puts "#{player1.name} remporte le combat"
		break
	end
puts player2.attacks(player1)
puts player1.show_state
	if player1.life_points <= 0
		puts "#{player1.name} a été tué par #{player2.name}"
		puts "#{player2.name} remporte le combat"
		break
	end
end

puts "--------------------------GAME OVER-----------------------------"

#binding.pry
