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
puts
puts

#Demande du nom du Super Sayan de notre jeu
puts "Quel est ton prénom ?"
print "> "
first_name = gets.chomp

puts
puts "        -------------------------------------------------"
puts "                               MENU                      "
puts "        -------------------------------------------------"
puts
#Création d'un nouveau jeu
my_game = Game.new(first_name)


#Boucle permettant de laisser le jeu se dérouler tant que cela est possible
while my_game.is_still_ongoing?
	puts "Voici l'état de notre héros:" 
	puts
	my_game.show_players
	puts

	my_game.menu
	my_game.menu_choice(my_game.ask_selection)
	my_game.enemies_attack

end

puts my_game.end
