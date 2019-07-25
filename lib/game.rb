class Game

  attr_accessor :human_player, :enemies, :player1, :player2, :player3, :player4

# -------------------------------------------------------------------------

  def initialize(name)

    puts "Saisir un nom de joueur"
    name = gets.chomp

  @human_player = HumanPlayer.new(name)

  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  player3 = Player.new("Adrien")
  player4 = Player.new("Lucie")

  @ennemies_array = [player1, player2, player3, player4]

  return @ennemies_array

  end 

# ----------------------------------------------------------------------------

  def menu_choice

    puts "---------------------------------------------------------------"
    puts "Il te reste #{human_player.life_points} points de vie, quelle action veux-tu effectuer ?"
    puts "","a - chercher une meilleure arme","s - chercher à se soigner"
    puts "", "attaquer un joueur en vue :"

    @ennemies_array.each {|ennemies| puts "#{@ennemies_array.index(ennemies)} - #{ennemies.name} a #{ennemies.life_points} points de vie"}


    human_player_decision = gets.chomp
    puts ""
 
  if human_player_decision == "a"
    human_player.search_weapon
    gets.chomp
  elsif human_player_decision == "s"
    human_player.search_health_pack
    gets.chomp
  else
    human_player.attacks(@ennemies_array[human_player_decision.to_i])

    if @ennemies_array[human_player_decision.to_i].life_points < 1
      kill_player(@ennemies_array[human_player_decision.to_i])
    end
    end_game
    gets.chomp
  end

  end 

# -----------------------------------------------------------------------------

  def enemies_attack
  puts "Les autres joueurs t'attaquent !"

  @ennemies_array.each {|ennemies| 
    ennemies.attacks(human_player)
    end_game
  }    
  end 

# ---------------------------------------------------------------

  def end_game
  


    if human_player.life_points < 1
      puts "Vous n'avez plus de point de vie"
      puts ""
      puts "   ************************************************************"
      puts "   ** ---------------  LOSER TU AS PERDU  ------------------ **"
      puts "   ** ------------------- *** FIN *** ---------------------- **"
      puts "   ************************************************************"
      puts ""
      exit
    elsif @ennemies_array.any? == false
      puts "Tous vos ennemis sont morts! Bravo, vous avez gagné la partie!"
      puts ""
      puts "   ************************************************************"
      puts "   ** ---------------------  BRAVO ! ----------------------- **"
      puts "   ** ------------------- *** FIN *** ---------------------- **"
      puts "   ************************************************************"
      puts ""
      exit
    else
    end

  end 

# ---------------------------------------------------------------------------

  def kill_player(player)
    @ennemies_array.delete(player)
  end

# -----------------------------------------------------------------------------


  def is_still_ongoing?
    (@ennemies_array.any? && @human_player.life_points > 0) ? true : false
  end 

end