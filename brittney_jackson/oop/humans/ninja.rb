require_relative 'humans'
class Ninja < Human

	def initialize
		super
		@stealth = 175
	end

	def steal(obj)
		if obj.class.ancestors.include?(Human)
			attack(obj)
			@health += 10
		end
	end 

	def get_away
		@health -= 15
		puts 'Im Outta Here'
	end
end

staci = Ninja.new
staci.steal('Wizard')
staci.get_away