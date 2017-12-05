class Dojo < ActiveRecord::Base

	validates :branch, :street, :city, presence: true, length: { in: 2..30 }
 	validates :state, presence: true, length: { is: 2 } 
end