require 'matrix'
require 'pry'

require_relative 'boardcase'

class Board
	attr_accessor :boardcases

	def initialize #à l'initialisation le plateau se dote d'un nb de colonne == nb de lignes via un nombre choisi élevé au carré
		@boardcases = [BoardCase.new("A1"),BoardCase.new("B1"),BoardCase.new("C1"),BoardCase.new("A2"),BoardCase.new("B2"),BoardCase.new("C2"), BoardCase.new("A3"),BoardCase.new("B3"),BoardCase.new("C3")]
	end

	def check_input(input)
		if (self.boardcases.any? {|boardcase| boardcase.coordinates_board == input}) #&& (input[0].class == Integer) && (input[1].class == Integer) => non nécessaire parce que gets.to_i
			return true
		else
			return false
		end
	end

	def availability(input)
		if self.boardcases.select{|boardcase| boardcase.coordinates_board == input}[0].status == false
			return false
		else
			return true
		end
	end

	def update(coordoninates_temp, new_owner) #le plateau "perd" une case et une case se remplit
		self.boardcases.select{ |boardcase| boardcase.coordinates_board == coordoninates_temp}[0].status = false
		self.boardcases.select{ |boardcase| boardcase.coordinates_board == coordoninates_temp}[0].owner = new_owner
		#puts self.boardcases.select{ |boardcase| boardcase.coordinates_board == coordoninates_temp}[0].coordinates_board
		#puts self.boardcases.select{ |boardcase| boardcase.coordinates_board == coordoninates_temp}[0].name
		#puts self.boardcases.select{ |boardcase| boardcase.coordinates_board == coordoninates_temp}[0].status
		#puts self.boardcases.select{ |boardcase| boardcase.coordinates_board == coordoninates_temp}[0].owner.name
	end

	def remove
		if !@boardcases.nil?
			remove_instance_variable(:@boardcases)
		end
	end

end

#plateau = Board.new
#puts plateau.boardcases[0,2].coordinates_board
#binding.pry
#puts "end-of-program"


#board = Board.new
#temp_array = [0,9]
#puts ("dsqdqsdqs".class == Integer)
