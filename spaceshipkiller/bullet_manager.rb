module SpaceshipCavern
	class BulletManager

		attr_accessor :bullets

		def initialize game
			@bullets = []
			@bullet_textures = {
				:gun => game.load_image('bullet_gun'),
				:smg => game.load_image('bullet_smg'),
				:cannon => game.load_image('bullet_cannon'),
			}
		end

		def fire position, velocity, damage, type
			bullet = Bullet.new(@bullet_textures[type])
			bullet.position = position
			bullet.velocity = velocity
			bullet.rotation = Math::atan2(velocity.y, velocity.x)
			bullet.damage = damage
			@bullets.push bullet
		end

		def clear
			@bullets.clear
		end

		def update dt

			@bullets.each do |b|
				b.update dt

				die = false
				# boundaries				
				if b.position.x < 0
					die = true
				end
				if b.position.x > $WIDTH
					die = true
				end
				if b.position.y < 0
					die = true
				end
				if b.position.y > $HEIGHT
					die = true
				end
				if die
					@bullets.delete b
				end
			end

		end

		def draw
			@bullets.each do |b|
				b.draw
			end
		end
	end
end