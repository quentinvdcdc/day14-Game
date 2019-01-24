require_relative './../views/show'
require_relative 'game'

class GarbageCollector
	def delete_all_objects
		ObjectSpace.each_object(Board) do |b|
			b.remove
		end

		ObjectSpace.each_object(BoardCase) do |c|
			c.remove
		end

		ObjectSpace.each_object(Player) do |player|
			player.remove
		end
	end
end