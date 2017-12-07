require_relative 'humans'
class Samurai < Human

	@@samurais = 0

	def initialize
		super
		@health = 200
		@samurais += 1
	end

	def death_blow(obj)
		obj.health = 0
		puts "you is ded"
		self

	end 

	def meditate
		@health = 200
		self
	end

	def how_many
		puts @samurais
	end
end

andy = Samurai.new
andy.death_blow(staci)