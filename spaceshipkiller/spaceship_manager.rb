module SpaceshipCavern
	class SpaceshipManager

		attr_accessor :spaceships, :wave

		def initialize game
			@game = game
			@textures = {
				:normal => game.load_image('spaceship'),
				:runner => game.load_image('spaceship_runner'),
				:brute => game.load_image('spaceship_brute'),
			}
			@spaceships = []
			@wave = 0
		end

		def clear
			@spaceship_count = 1
			@spaceships.clear
			@wave = 0
		end

		def spawn_spaceships			
			@spaceship_count.to_i.times do |i|
				type = :normal
				type_val = rand()
				if type_val > 0.9
					type = :brute
				elsif type_val > 0.8
					type = :runner
				end
				z = Spaceship.new(@textures[type], type, @game)
				left = rand() > 0.5
				if left
					z.position.x = -100 * rand()
					z.position.y = rand() * $HEIGHT
				else
					z.position.x = $WIDTH + 100 * rand()
					z.position.y = rand() * $HEIGHT
				end
				@spaceships.push z
			end
			@spaceship_count *= 1.6
			@wave += 1
		end

		def spawn_children position		
			4.times do |i|
				z = Spaceship.new(@textures[:runner], :runner, @game)
				z.position.x = position.x + (-0.5 + rand()) * 64
				z.position.y = position.y + (-0.5 + rand()) * 64
				@spaceships.push z
			end
		end

		def update dt, player

			if @spaceships.size == 0
				spawn_spaceships()
			end

			# spaceships
			@spaceships.each do |z|
				z.update dt, player
			end	

		end

		def draw
			@spaceships.each do |z|
				z.draw
			end	
		end
	end
end