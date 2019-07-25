require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "	  ------------------------------------------------"
puts "	  |BIENVENUE SUR 'ILS VEULENT TOUS MA POO' !!!!! |"
puts "	  |Le but du jeu est d'être le dernier survivant |"
puts "	  ------------------------------------------------"

#------------------------------------------------------
puts "Saisir un nom de joueur"
player3 = HumanPlayer.new(gets.chomp.to_s)

#-----------------------------------------------------
player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemies = [player1, player2]
joueur = player3

while player3.life_points > 0 && player1.life_points > 0 || player2.life_points > 0

	if 
		player3.life_points <= 0
		puts "¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯LOSER VOUS AVEZ PERDU !!!¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯"
		break
	end

	puts "¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨Voici l'état de santé de ton joueur¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨"
	puts "\n"
	puts player3.show_state
	puts "¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯Quelle action veux-tu effectuer ?¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯"
	puts "\n"
	puts "a - Chercher une meilleure arme"
	puts "s - chercher à se soigner"
	puts "0 - #{player1.name} a #{player1.life_points} points de vie"
	puts "1 - #{player2.name} a #{player2.life_points} points de vie"

	choice = gets.chomp
		case choice
      	when "a" then joueur.search_weapon
      	when "s" then joueur.search_health_pack
     	when "1" then joueur.attacks(player2) if player2.life_points > 0
      	when "0" then joueur.attacks(player1) if player1.life_points > 0
      	else
		puts "Choix invalide"
		choice = gets.chomp
		end

		if 	player1.life_points <= 0 &&	player2.life_points <= 0 
			puts "Vous avez mis un joueur KO"
			puts "¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯VOUS AVEZ GAGNÉ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯"
			break
		end

		puts "Les autres joueurs t'attaquent !!!"
		puts "\n"
		ennemies.each do |ennemie|
		ennemie.attacks(joueur) if joueur.life_points > 0 && ennemie.life_points > 0
	end
end