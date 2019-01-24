require 'matrix'

class Show
	def player_inscription_1
		puts "Hello moto ! Today is the day, synchronisation des montres. Ready, steady, go.\nPlayer n°1 inscrivez-vous"
		print "> "
		return gets.chomp
	end

	def player_inscription_2
		puts "My pleasure. Player n°2, before being baptised, have you ever played the devil in the pale moonlight ?"
		print "> "
		return gets.chomp
	end

	def round(player) #description des commandes à chaque round de jeu
		puts "A ton tour #{player}, quelle case veux-tu choisir ?\nVois le plateau pour les cases dispo" #voici les choses
		#puts self.boardcases.select{|boardcase| boardcase.status == true}
		print "> "
		return [gets.to_i, gets.to_i]
	end

	def board(board_select) #creation du plateau et update du plateau avec positionnement de la case sur le plateau
		system "clear"
		puts "-" * 31
		case 
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].status == true
			puts"|         |         |         | 
|         |         |         | 
|         |         |         | 
|         |         |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "rond" 
			puts"|         |         |         |
|         |         |    *    | 
|         |         |  *   *  | 
|         |         |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|         |         |  *   *  | 
|         |         |    *    | 
|         |         |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "rond"  && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].status == true
			puts"|         |         |         | 
|         |    *    |         |
|         |  *   *  |         |
|         |    *    |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|         |    *    |    *    |
|         |  *   *  |  *   *  |
|         |    *    |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|         |    *    |  *   *  | 
|         |  *   *  |    *    | 
|         |    *    |  *   *  | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].status == true
			puts"|         |         |         | 
|         |  *   *  |         | 
|         |    *    |         | 
|         |  *   *  |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|         |  *   *  |    *    | 
|         |    *    |  *   *  | 
|         |  *   *  |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|         |  *   *  |  *   *  | 
|         |    *    |    *    |  
|         |  *   *  |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].status == true
			puts"|         |         |         | 
|    *    |         |         | 
|  *   *  |         |         | 
|    *    |         |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|    *    |         |    *    | 
|  *   *  |         |  *   *  | 
|    *    |         |    *    | 
|         |         |         | 
" 
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|    *    |         |  *   *  | 
|  *   *  |         |    *    | 
|    *    |         |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].status == true
			puts"|         |         |         | 
|    *    |    *    |         |
|  *   *  |  *   *  |         |
|    *    |    *    |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|    *    |    *    |    *    |
|  *   *  |  *   *  |  *   *  |
|    *    |    *    |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|    *    |    *    |  *   *  | 
|  *   *  |  *   *  |    *    | 
|    *    |    *    |  *   *  | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].status == true
			puts"|         |         |         | 
|    *    |  *   *  |         | 
|  *   *  |    *    |         | 
|    *    |  *   *  |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|    *    |  *   *  |    *    | 
|  *   *  |    *    |  *   *  | 
|    *    |  *   *  |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|    *    |  *   *  |  *   *  | 
|  *   *  |    *    |    *    |  
|    *    |  *   *  |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].status == true
			puts"|         |         |         | 
|  *   *  |         |         | 
|    *    |         |         | 
|  *   *  |         |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|  *   *  |         |    *    | 
|    *    |         |  *   *  | 
|  *   *  |         |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|  *   *  |         |  *   *  | 
|    *    |         |    *    | 
|  *   *  |         |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].status == true
			puts"|         |         |         | 
|  *   *  |    *    |         |
|    *    |  *   *  |         |
|  *   *  |    *    |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|  *   *  |    *    |    *    |
|    *    |  *   *  |  *   *  |
|  *   *  |    *    |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|  *   *  |    *    |  *   *  | 
|    *    |  *   *  |    *    | 
|  *   *  |    *    |  *   *  | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].status == true
			puts"|         |         |         | 
|  *   *  |  *   *  |         | 
|    *    |    *    |         | 
|  *   *  |  *   *  |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|  *   *  |  *   *  |    *    | 
|    *    |    *    |  *   *  | 
|  *   *  |  *   *  |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|  *   *  |  *   *  |  *   *  | 
|    *    |    *    |    *    |  
|  *   *  |  *   *  |  *   *  |
|         |         |         | 
"	

		end
		puts "-" * 31
		case #allez on dessine la deuxieme ligne
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].status == true
			puts"|         |         |         | 
|         |         |         | 
|         |         |         | 
|         |         |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "rond" 
			puts"|         |         |         |
|         |         |    *    | 
|         |         |  *   *  | 
|         |         |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|         |         |  *   *  | 
|         |         |    *    | 
|         |         |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "rond"  && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].status == true
			puts"|         |         |         | 
|         |    *    |         |
|         |  *   *  |         |
|         |    *    |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|         |    *    |    *    |
|         |  *   *  |  *   *  |
|         |    *    |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|         |    *    |  *   *  | 
|         |  *   *  |    *    | 
|         |    *    |  *   *  | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].status == true
			puts"|         |         |         | 
|         |  *   *  |         | 
|         |    *    |         | 
|         |  *   *  |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|         |  *   *  |    *    | 
|         |    *    |  *   *  | 
|         |  *   *  |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|         |  *   *  |  *   *  | 
|         |    *    |    *    |  
|         |  *   *  |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].status == true
			puts"|         |         |         | 
|    *    |         |         | 
|  *   *  |         |         | 
|    *    |         |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|    *    |         |    *    | 
|  *   *  |         |  *   *  | 
|    *    |         |    *    | 
|         |         |         | 
" 
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|    *    |         |  *   *  | 
|  *   *  |         |    *    | 
|    *    |         |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].status == true
			puts"|         |         |         | 
|    *    |    *    |         |
|  *   *  |  *   *  |         |
|    *    |    *    |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|    *    |    *    |    *    |
|  *   *  |  *   *  |  *   *  |
|    *    |    *    |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|    *    |    *    |  *   *  | 
|  *   *  |  *   *  |    *    | 
|    *    |    *    |  *   *  | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].status == true
			puts"|         |         |         | 
|    *    |  *   *  |         | 
|  *   *  |    *    |         | 
|    *    |  *   *  |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|    *    |  *   *  |    *    | 
|  *   *  |    *    |  *   *  | 
|    *    |  *   *  |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|    *    |  *   *  |  *   *  | 
|  *   *  |    *    |    *    |  
|    *    |  *   *  |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].status == true
			puts"|         |         |         | 
|  *   *  |         |         | 
|    *    |         |         | 
|  *   *  |         |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|  *   *  |         |    *    | 
|    *    |         |  *   *  | 
|  *   *  |         |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|  *   *  |         |  *   *  | 
|    *    |         |    *    | 
|  *   *  |         |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].status == true
			puts"|         |         |         | 
|  *   *  |    *    |         |
|    *    |  *   *  |         |
|  *   *  |    *    |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|  *   *  |    *    |    *    |
|    *    |  *   *  |  *   *  |
|  *   *  |    *    |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|  *   *  |    *    |  *   *  | 
|    *    |  *   *  |    *    | 
|  *   *  |    *    |  *   *  | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].status == true
			puts"|         |         |         | 
|  *   *  |  *   *  |         | 
|    *    |    *    |         | 
|  *   *  |  *   *  |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|  *   *  |  *   *  |    *    | 
|    *    |    *    |  *   *  | 
|  *   *  |  *   *  |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|  *   *  |  *   *  |  *   *  | 
|    *    |    *    |    *    |  
|  *   *  |  *   *  |  *   *  |
|         |         |         | 
"	

		end
		puts "-" * 31
		case #allez on dessine la troisieme ligne
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].status == true
			puts"|         |         |         | 
|         |         |         | 
|         |         |         | 
|         |         |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "rond" 
			puts"|         |         |         |
|         |         |    *    | 
|         |         |  *   *  | 
|         |         |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|         |         |  *   *  | 
|         |         |    *    | 
|         |         |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "rond"  && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].status == true
			puts"|         |         |         | 
|         |    *    |         |
|         |  *   *  |         |
|         |    *    |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|         |    *    |    *    |
|         |  *   *  |  *   *  |
|         |    *    |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|         |    *    |  *   *  | 
|         |  *   *  |    *    | 
|         |    *    |  *   *  | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].status == true
			puts"|         |         |         | 
|         |  *   *  |         | 
|         |    *    |         | 
|         |  *   *  |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|         |  *   *  |    *    | 
|         |    *    |  *   *  | 
|         |  *   *  |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|         |  *   *  |  *   *  | 
|         |    *    |    *    |  
|         |  *   *  |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].status == true
			puts"|         |         |         | 
|    *    |         |         | 
|  *   *  |         |         | 
|    *    |         |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|    *    |         |    *    | 
|  *   *  |         |  *   *  | 
|    *    |         |    *    | 
|         |         |         | 
" 
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|    *    |         |  *   *  | 
|  *   *  |         |    *    | 
|    *    |         |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].status == true
			puts"|         |         |         | 
|    *    |    *    |         |
|  *   *  |  *   *  |         |
|    *    |    *    |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|    *    |    *    |    *    |
|  *   *  |  *   *  |  *   *  |
|    *    |    *    |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|    *    |    *    |  *   *  | 
|  *   *  |  *   *  |    *    | 
|    *    |    *    |  *   *  | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].status == true
			puts"|         |         |         | 
|    *    |  *   *  |         | 
|  *   *  |    *    |         | 
|    *    |  *   *  |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|    *    |  *   *  |    *    | 
|  *   *  |    *    |  *   *  | 
|    *    |  *   *  |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|    *    |  *   *  |  *   *  | 
|  *   *  |    *    |    *    |  
|    *    |  *   *  |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].status == true
			puts"|         |         |         | 
|  *   *  |         |         | 
|    *    |         |         | 
|  *   *  |         |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|  *   *  |         |    *    | 
|    *    |         |  *   *  | 
|  *   *  |         |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].status == true && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|  *   *  |         |  *   *  | 
|    *    |         |    *    | 
|  *   *  |         |  *   *  |
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].status == true
			puts"|         |         |         | 
|  *   *  |    *    |         |
|    *    |  *   *  |         |
|  *   *  |    *    |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|  *   *  |    *    |    *    |
|    *    |  *   *  |  *   *  |
|  *   *  |    *    |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "rond" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|  *   *  |    *    |  *   *  | 
|    *    |  *   *  |    *    | 
|  *   *  |    *    |  *   *  | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].status == true
			puts"|         |         |         | 
|  *   *  |  *   *  |         | 
|    *    |    *    |         | 
|  *   *  |  *   *  |         | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "rond"
			puts"|         |         |         | 
|  *   *  |  *   *  |    *    | 
|    *    |    *    |  *   *  | 
|  *   *  |  *   *  |    *    | 
|         |         |         | 
"
		when board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner.avatar == "croix" && board_select.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner.avatar == "croix"
			puts"|         |         |         | 
|  *   *  |  *   *  |  *   *  | 
|    *    |    *    |    *    |  
|  *   *  |  *   *  |  *   *  |
|         |         |         | 
"	

		end
		puts "-" * 31
	end

	def update_boardcase #update de la case
		
	end
end



		def board #creation du plateau et update du plateau avec positionnement de la case sur le plateau
		system "clear"
		puts "-" * 31
		puts ("|" + " " * 9) * 3 + "|", ("|" + " " * 9) * 3 + "|", ("|" + " " * 9) * 3 + "|", ("|" + " " * 9) * 3 + "|"
		puts "-" * 31
		puts ("|" + " " * 9) * 3 + "|", ("|" + " " * 9) * 3 + "|", ("|" + " " * 9) * 3 + "|", ("|" + " " * 9) * 3 + "|"
		puts "-" * 31
		puts ("|" + " " * 9) * 3 + "|", ("|" + " " * 9) * 3 + "|", ("|" + " " * 9) * 3 + "|", ("|" + " " * 9) * 3 + "|"
		puts "-" * 31
	end

#puts Show.new.board

#line 1 variante 1


