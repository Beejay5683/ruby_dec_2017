class RpgController < ApplicationController

	def index
		session[:total] ||= 0
		session[:activity] ||= []
		render 'index.html.erb'
	end

	def gold
		timestamp = Time.now.strftime("%d/%m/%Y %H:%M %p")
		

		if params[:ninja]['building']=='farm'
			p session[:gold]=rand(10..20)
			session[:total] += session[:gold]
			session[:activity].unshift("Earned #{session[:gold]} gold from the farm! #{ timestamp }")
			puts session[:activity]
		elsif params[:ninja]['building']=='cave'
			p session[:gold]=rand(5..10)
			session[:total] += session[:gold]
			session[:activity].unshift("Earned #{session[:gold]} gold from the cave! #{ timestamp }")
		elsif params[:ninja]['building']=='house'
			p session[:gold]=rand(2..5)
			session[:total] += session[:gold]
			session[:activity].unshift("Earned #{session[:gold]} gold from the house! #{ timestamp }")
		elsif params[:ninja]['building']=='casino'
			p session[:gold]=rand(-50..50)
			session[:total] += session[:gold]
			if session[:gold]>=0
				session[:activity].unshift("Earned #{session[:gold]} gold from the casino! #{ timestamp }")
			else
				session[:activity].unshift("Lost #{session[:gold]} gold from the casino #{ timestamp }")
			end
		end

		return redirect_to('/')
	end

	def reset
		session.clear
		return redirect_to('/')
	end

	
end