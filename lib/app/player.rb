class Player
	attr_accessor :name, :avatar, :order_to_play
	@@iteration_player = "player_1"

	def initialize(name_done) #name, on leur fige une croix ou un rond
		@name = name_done
		@avatar = avatar_meth
		@@iteration_player = "player_2"
	end

	def avatar_meth #NB : ne jamais appeler une méthode comme une variable d'instance
		case Player.iteration_player
		when "player_1"
			return "croix"
		when "player_2"
			return "rond"
		end
	end

	def self.iteration_player
		return @@iteration_player
	end

	def remove
		if !@name.nil?
			remove_instance_variable(:@name)
		end
		if !@avatar.nil?
			remove_instance_variable(:@avatar)
		end
		if !@order_to_play
			remove_instance_variable(:@order_to_play)
		end
	end

end