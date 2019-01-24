require 'bundler'
require 'matrix'

Bundler.require

#$:.unshift File.expand_path(".", __FILE__)
require_relative 'player'
require_relative 'board'
require_relative 'boardcase'
require_relative 'garbage_collector'

#$:.unshift File.expand_path("./../lib/views", __FILE__)
require_relative './../views/show'

class Game
	attr_accessor :players, :board
	@@game_round_number = 0

	def initialize
		@show = Show.new
		@board = Board.new

	end

	def creation_players(play_1, play_2) #player se donne un nom
		player_1 = Player.new(play_1)
		player_2 = Player.new(play_2)
		@players = [player_1, player_2]
	end

	def first_player_to_play? #determinons qui va jouer en premier 
		if rand(1..2) == 1
			self.players[0].order_to_play = "even"
			self.players[1].order_to_play = "odd"
		else
			self.players[0].order_to_play = "odd"
			self.players[1].order_to_play = "even"
		end
		whosboss = self.players.select{|player| player.order_to_play == "even"}[0]
		firstname = whosboss.name
		puts "#{firstname} a gagné le toss, bogoss~bellegosse"
	end

	def player_to_play #player dont c'est le tour de jouer | indentation starts at 0 => "even"
		case 
		when Game.round_number.odd?
			return self.players.select{|player| player.order_to_play == "odd"}[0]
		when Game.round_number.even?
			return self.players.select{|player| player.order_to_play == "even"}[0]
		end
	end

	def check_error_position(coordoninates_temp)
		if @board.availability(coordoninates_temp)
			@board.update(coordoninates_temp,self.player_to_play)
			@@game_round_number += 1
			#binding.pry
			#puts "so far so good"
		else
			puts "Vous n'avez pas vu Loulou ? Loulou ? Louuulouuu ?"
			return self.round
		end
	end

	def check_error_variable(coordoninates_temp)
		if @board.check_input(coordoninates_temp)
			self.check_error_position(coordoninates_temp)
		else
			puts "The Number You Dial is Busy, Please Hang Out the Phone and Call it Later"
			return self.round
		end
	end

#	def check_victory(coordoninates_temp)
#		if !self.diagonally_victorious && !self.vertically_victorious && !self.horizontally_victorious
#				self.check_error_variable(coordoninates_temp)
#		else
#			@show.board(@board)
#			puts "End of the Game"
#		end
#	end

#	def launch_until_draw
#		while @@game_round_number < 9
#			self.round
#		end
#		@show.board(@board)
#		puts "This is a draw"
#	end

	def round #choix de la case du plateau par un joueur dans la limite disponible
		@show.board(@board)
		coordoninates_temp = @show.round(self.player_to_play.name)
		self.check_error_variable(coordoninates_temp)
	end

	def self.round_number
		return @@game_round_number
	end

	def diagonally_victorious
		case #on va tester si [0,0] == [1,1] == [2,2] ont le même owner, puis si [0,2] == [1,1] == [2,0] ont le même owner
		when (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner) && (@board.boardcases.select{ |boardcase| (boardcase.coordinates_board == [0,0]) || (boardcase.coordinates_board == [1,1]) || (boardcase.coordinates_board == [2,2])}.all?{ |boardcase| boardcase.status == false})
			return true
		when (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner) && (@board.boardcases.select{ |boardcase| (boardcase.coordinates_board == [2,0]) || (boardcase.coordinates_board == [1,1]) || (boardcase.coordinates_board == [0,2])}.all?{ |boardcase| boardcase.status == false})
			return true
		end
		return false
	end

	def vertically_victorious
		case #on va tester si [0,0] == [1,1] == [2,2] ont le même owner, puis si [0,2] == [1,1] == [2,0] ont le même owner
		when (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board[1] == 0}.all?{ |boardcase| boardcase.status == false})
			return true
		when (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board[1] == 1}.all?{ |boardcase| boardcase.status == false})
			return true
		when (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board[1] == 2}.all?{ |boardcase| boardcase.status == false})
			return true
		end
		return false
	end

	def horizontally_victorious
		case #on va tester si [0,0] == [1,1] == [2,2] ont le même owner, puis si [0,2] == [1,1] == [2,0] ont le même owner
		when (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,1]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [0,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board[0] == 0}.all?{ |boardcase| boardcase.status == false})
			return true
		when (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,1]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [1,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board[0] == 1}.all?{ |boardcase| boardcase.status == false})
			return true
		when (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,0]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,1]}[0].owner == @board.boardcases.select{ |boardcase| boardcase.coordinates_board == [2,2]}[0].owner) && (@board.boardcases.select{ |boardcase| boardcase.coordinates_board[0] == 2}.all?{ |boardcase| boardcase.status == false})
			return true
		end
		return false
	end

	def reinitialization
    @@game_round_number = 0
    #@players = []
  end


	def launch(play_1, play_2) #check si partie est done ou si on doit continuer - voir le cas des draw => règle du game ici
		#si un même owner a 3 mêmes x_position || si un même owner a 3 mêmes y_position || si un owner a 3 !x_position && 3 !y_position
		#when diagonally_victorious || vertically_victorious || horizontally_victorious
		#	return #c'est gagné bande de fifous
		#GarbageCollector.delete_all_objects
		self.reinitialization
		self.creation_players(play_1, play_2)
		self.first_player_to_play?
		puts @@game_round_number
		#puts !self.diagonally_victorious && !self.vertically_victorious && !self.horizontally_victorious
		binding.pry
		while !self.diagonally_victorious && !self.vertically_victorious && !self.horizontally_victorious && !(@@game_round_number == 9)
				self.round
		end
		case 
		when self.diagonally_victorious || self.vertically_victorious || self.horizontally_victorious
			@show.board(@board)
			puts "End of the Game"
		when @@game_round_number >= 9
			@show.board(@board)
			puts "This is a Draw"
		end
	end
end
