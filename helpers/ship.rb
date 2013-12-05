module Helpers

	def current_ship(id)
		Ship.get(id)
  end

end