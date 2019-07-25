require 'pry'

#---------------------------------Mini_jeu_POO 1.0---------------------------------

class Player

	attr_accessor :name, :life_points

def initialize(player_name)
	@name = player_name
	@life_points = 10
end

def show_state
	puts "#{@name} a #{@life_points} points de vie"
end

def gets_damage(damage_received)
	@life_points -= damage_received

	if @life_points <= 0
		puts "> Le joueur #{@name} a été tué !"
	end
end

def attacks(player)
	puts "Le joueur #{@name} attaque le joueur #{player.name}"
	damage = compute_damage
	puts "Il lui inflige #{damage} points de dommages"
	player.gets_damage(damage)
end

def compute_damage
	return rand(1..6)
end

end

#-----------------------------------Mini_jeu_POO 2.0------------------------------

class HumanPlayer < Player

	attr_accessor :weapon_level

def initialize(name)
	super (name)
	@life_points = 100
	@weapon_level = 1
end

def show_state
	puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
end


def compute_damage
	rand(1..6) * @weapon_level
end

def search_weapon
	new_weapon = rand(1..6)
	puts "Tu as trouvé une arme de niveau #{new_weapon}"

	if new_weapon > @weapon_level
		puts "Youhu !! Elle est meilleure que ton arme actuelle: tu la prends."

		@weapon_level = new_weapon 
	elsif 
		new_weapon <= @weapon_level
		puts "M@*#$ ... elle n'est pas mieux que ton arme actuelle...Mieux vaut la laisser"
end
end

def search_health_pack
	health = rand(1..6)
	if health == 1
		puts "Tu n'as rien trouvé.."

	elsif health <= 2 || health >= 5
		puts "Bravo, tu as trouvé un pack de +50 points de vie !"
		@life_points += 50

	elsif health == 6
		puts "Waow, tu as trouvé un pack de +80 points de vie !"
		@life_points += 80
	end

	if @life_points >= 100
		@life_points = 100
		puts "Vous êtes au maximum de votre PV"
	end
end

end