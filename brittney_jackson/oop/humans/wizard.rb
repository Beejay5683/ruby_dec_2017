require_relative 'humans'
class Wizard < Human

	def initialize
		super
		@health = 50
		@intelligence = 25
	end

	def heal
		@health += 10

	end

	def fireball(obj)
		if obj.class.ancestors.include?(Human)
			obj.health -= 20
			puts 'I got ya!'
		end
	end
end

bee = Wizard.new
bee.fireball('Samurai')
