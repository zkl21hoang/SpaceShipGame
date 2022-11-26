class Numeric
	def to_degrees
		self * 180 / Math::PI
	end
	def to_radians
		self * Math::PI / 180
	end
end

module SpaceshipCavern
	def self.lerp(min, max, weight)
		min + (max - min) * weight
	end
end
