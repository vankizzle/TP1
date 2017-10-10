require 'csv'
class ApplicationController < ActionController::Base
  
	protect_from_forgery with: :null_session 
  
	def sums 
		sum = 0

		CSV.foreach(params['file'].path) do |row|
	
		sum+=row[0].to_i

		end

		sum = sum.ceil 
		render plain: ('%.2f'%sum);

	end
end
