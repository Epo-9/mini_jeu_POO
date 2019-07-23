class Player
	  attr_accessor :name, :life_points

	  	#initialisation des informations propre à un joueur
	def initialize(name_str)
		@name = name_str
		@life_points = 10	  	
	end

		#Indique les fonctions du joueur ( son nom et son nombre de PV)
	def show_state
		puts "#{@name} a #{@life_points} points de vie"		 
	end

		#L'attribut "damage" indique le nombre de point perdu suite à une attaque
	def gets_damage(damage)
		@life_points = @life_points - damage
		if @life_points <= 0
			puts "Le joueur #{@name} a été tué"
		end	
	end

		#intégration d'un nouveau joueur, punch receive correspond à l'attaque, on souhaite également indiqué le nombre de point perdu en faisant appel à la méthode compute_damage qui tire un numéro aléatoire entre 1 et 6
	def attacks(player_attack)
		puts "Le joueur #{@name} attaque #{player_attack.name}"
		punch_receive = compute_damage
		puts "Il lui inflige #{punch_receive} points de dommages"
		player_attack.gets_damage(punch_receive)
		
	end

		#permet de tirer un numéro aléatoire qui va engendrer les dégats fait par un joueur lors d'une aléatoire lors d'une attaque
	def compute_damage
		rand(1..6)	
	end

end 




	  #Cette nouvelle classe hérite de tous les attributs et méthode que Player
class HumanPlayer < Player
	  attr_accessor :weapon_level

        #fait référence au code initial, le "super" permet de garder les informations du name_str de ma class Player
	def initialize(name_str)
		super (name_str) 
		@life_points = 100
		@weapon_level = 1 #j'ai rajouté cette ligne
	end
	
	def show_state
		super
		print "et une arme de niveau #{weapon_level}"
	end


	def compute_damage
		super * weapon_level
	end

		#Méthode permettant de chercher une nouvelle arme et en fonction de son niveau par raport à l'arme actuelle décide ou non de l'utiliser
	def search_weapon
		dice = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{dice}"
		if weapon_level < dice
			puts "Youhou! Elle est meilleure que ton arme est actuelle: tu la prends."
			@weapon_level = dice
		else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."	
		end		
	end

        #Méthode qui permettra à notre super héro de rechercher des packs de vie
	def search_health_pack
		dice = rand(1..6)
		if dice == 1
			puts " Tu n'as rien trouvé..."
		elsif dice == 6
			puts "Waow, tu as trouvé un pack de +80 points de vie !"
			if @life_points <= 20
			@life_points += 80
			else 
			@life_points = 100
			end
 		else puts "Bravo, tu as trouvé un pack de +50 points de vie !"
 			if @life_points <= 50
			@life_points += 50
			else
			@life_points = 100
			end
		end
	end

end

