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
	
	def filter
		sum = 0

		CSV.foreach(params['file'].path) do |row|
			if row[2].to_i % 2!=0 
       				cdsum+=row[1].to_i
			end
		end
		
		sum = sum.ceil 
		render plain: ('%.2f'%sum);
	end
	
	def intervals
		
	file = CSV.parse(params["file"].read, converters: :numeric)
	len = file.length - 30
	couter = 0
	maxSum = 0
		while counter <= len do
			count = 0
			sum = 0
			arr.each do |row|
				
				if count >= counter
					sum += row[0]
				end
				count += 1
				
				if count == 30 + counter
					break
				end
			end
			if maxSum <= sum
				maxSum = sum
			end
			counter += 1
		end 
		render plain: ('%.2f'%maxSum);
end
		

	end
end
