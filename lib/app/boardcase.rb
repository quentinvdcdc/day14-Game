class BoardCase
	attr_accessor :name, :status, :owner, :coordinates_board #remembering TS1 loading... le point A(3,1)
	@@count = 1

	def initialize(name_case) #les cases sont vides, les owners vides, position à figer sur le board
		@name = name_case
		@coordinates_board = [BoardCase.x_on_board, BoardCase.y_on_board]
		@status = true
		@@count += 1
	end

	def self.x_on_board
		case @@count
		when 1, 2, 3
			return 0
		when 4, 5, 6
			return 1
		when 7, 8, 9
			return 2
		end
	end

	def self.y_on_board
		case @@count
		when 1, 4, 7
			return 0 #"A"
		when 2, 5, 8
			return 1 #"B"
		when 3, 6, 9
			return 2 #"C"
		end
	end


	def update(owner) # +1 owner +1 status
		@status = false
		@owner = owner
	end

	def remove
		if !@name.nil?
			remove_instance_variable(:@name)
		end
		if !@status.nil?
			remove_instance_variable(:@status)
		end
		if !@owner.nil?
			remove_instance_variable(:@owner)
		end
		if !@oordinates_board.nil?
			remove_instance_variable(:@coordinates_board)
		end
	end

end