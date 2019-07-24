class Game

	attr_accessor :human_player, :enemies
	
	#Methode permettant de créer notre array d'enemies à zigouiller ainsi que le profil de notre vaillant Super Sayan
	def initialize(user_name)
		@human_player = HumanPlayer.new(user_name)
		@enemies = [enemie1 = Player.new("Don_Vilano"), enemie2 = Player.new("Don_moutcho") , enemie3 = Player.new("Don_Yvonnov"), enemie4 =Player.new("Don_Franco")]
	end

	#Méthode qui prend un player et le supprime dès lors que nous avons régler son compte :)
	def kill_player(player_dead)
	@enemies.delete(player_dead)
	end

	#Methode permettant de déterminer si le jeu est toujours en cours
	def is_still_ongoing?
		if @human_player.life_points >0 && !@enemies.empty?
			return true
		else
			return false
		end
	end

	#Méthode qui affiche l'état de notre héro ainsi que le nombre de bot restant
	def show_players
		puts human_player.show_state
		puts "Il reste #{enemies.size} enemies à zigouiller"
	end


	#Méthode qui Affiche le menu par défaut au joueur
	def menu
		puts "Quelle action veux-tu effectuer ?"
		puts
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner "
		puts
		puts "attaquer un joueur en vue :"
		i = 0
		@enemies.each do |bad_guys|
			print "#{i} - "
			puts bad_guys.show_state
			i += 1
		end
	end

	#Menu permettant de faire réagir le jeu en fonction du choix de l'utilisateur
	def menu_choice(selector)

		if selector == "a"
			@human_player.search_weapon
		elsif selector == "s"
			@human_player.search_health_pack
		
		else
      		@human_player.attacks(@enemies[selector.to_i])

    		@enemies.each do |player_dead| 
	    		if player_dead.life_points <= 0
	    			kill_player(player_dead)
	    		end
    		end
    	end 
			
		#elsif selector == "q"
		#	break
		#else
		#	puts "Recommencez et veuillez vous référer aux choix proposés !!!"
		#end	
	end

	#Méthode permettant aux ennemies de réagir: Si notre héro s'est fait buté pendant une attaque, le jeu s'arrête
	def enemies_attack
		if is_still_ongoing?
	    puts "Les autres joueurs t'attaquent !"
	    @enemies.each do |bad_boys|
        bad_boys.attacks(@human_player) 
	        if @human_player.life_points <= 0
	          break
	        end
      	end
    	end	
	end

	#Méthode qui permet d'indiquer la fin du jeu en fonction de l'issue
	def end
		puts "La partie est finie"
		if @human_player.life_points > 0
		puts "BRAVO ! TU AS GAGNE"
		else
		puts "Loser ! Tu as perdu !"
		end	
	end

	#Methode permettant de définir les types d'input que le joueur peut fournir
  	def ask_selection
	    print "> "
	    selector = gets.chomp
	    unless (['a','s'] + Array.new(@enemies.length){ |i| i.to_s}).include? selector
	      puts "Recommencez et veuillez vous référer aux choix proposés !!!"
	      print "> "
	      selector = gets.chomp
	    end
	    selector
 	end
		
end

