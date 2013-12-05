module Helpers
	ALPHABET = ('a'..'z').to_a


	def letter(number)
		ALPHABET[number].upcase 
	end

	def number(letter)
		ALPHABET.index(letter.downcase)
	end

	def coordinates(cell)
		return letter(cell.x_position).to_s + (cell.y_position + 1).to_s
	end

	def opponent_cell_position(id)
		cell = Cell.first(:id => id.to_s)
		[cell.x_position,cell.y_position]
	end

	def select_cell(coordinates)
		x_position, y_position = coordinates_to_position(coordinates)
		Cell.first(x_position: x_position,y_position: y_position )
	end

	def coordinates_to_position(coordinates)
			coordinates.include?(",") ? array = coordinates.split(",") : array = coordinates.split("")
			x_position = number(array[0])
			y_position = array[1].to_i - 1
			return x_position , y_position
	end
end