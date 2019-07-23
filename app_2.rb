# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/game.rb et lib/player.rb
require_relative 'lib/game'
require_relative 'lib/player'

puts "        -------------------------------------------------"
puts "        |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "        |Le but du jeu est d'être le dernier survivant !|"
puts "        -------------------------------------------------"

#Demande du nom du héros de notre jeu
puts "Quel est ton prénom ?"
print "> "
first_name = gets.chomp

#Création du héros
user = HumanPlayer.new(first_name)

#Création de l'array enemies
enemies = []

#Création des 2 enemies
enemies << player1 = Player.new("Josiane") 
enemies << player2 = Player.new("José") 

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
	puts
	puts "Voici l'état de notre héros:" 
	puts user.show_state
	puts
	puts "Quelle action veux-tu effectuer ?"
	puts
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner "
	puts
	puts "attaquer un joueur en vue :"
		if player1.life_points > 0
	print "0 - " 
	puts player1.show_state
		end
		if player2.life_points > 0
	print "1 - "
	puts player2.show_state
		end
	print "> " 
	selected = gets.chomp
	
	if selected == "a"
		user.search_weapon
	elsif selected == "s"
		user.search_health_pack
	elsif selected == "0"
		if player1.life_points > 0
		user.attacks(player1)
		else
		puts "#{player1.name} est morte0, recommencez et veuillez vous référer aux choix proposés !!!"
		end
	elsif selected == "1"
		if player2.life_points > 0
		user.attacks(player2)
		else
		puts "#{player2.name} est mort, recommencez et veuillez vous référer aux choix proposés !!!"
		end
	elsif selected == "q"
		break
	else
		puts "Recommencez et veuillez vous référer aux choix proposés !!!"
	end
	
	if player1.life_points > 0 || player2.life_points >0
	puts "Les autres joueurs t'attaquent !"
	end
	enemies.each do |enemy|
		if enemy.life_points > 0
		enemy.attacks(user)
		end	
	end
end

#Message de fin conditioné par l'issue de la partie
puts "La partie est finie"
	if user.life_points > 0
	puts "BRAVO ! TU AS GAGNE"
	else
	puts "Loser ! Tu as perdu !"
	end

binding.pry