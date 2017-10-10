require 'csv'
require 'linear-regression'
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
       				sum+=row[1].to_i
			end
		end
		
		sum = sum.ceil 
		render plain: ('%.2f'%sum);
	end
	
	def intervals
		
	sum=0
    	current_row=0
    	max_sum=0
    	file=CSV.parse(params[:file].path)
    
    	while current_row < file.length-29 do
        i=0
        
		while i<30
          		sum+=file[current_row+i][0].to_i;
          		i+=1
        	end  
        
		if sum > max_sum
       	   		max_sum=sum
       		end 
        sum=0;
        current_row+=1 
 
	end
    max_sum=max_sum.ceil
     render plain: '%.2f' % max_sum
    end   
	
	def lin_regressions
	
	
        file =CSV.parse(params[:file].path)
        xs = (1..file.length).to_a;
        ys =  file.map { |n| n[0].to_i };
        linear = Regression::Linear.new(xs, ys);
        a = linear.slope;
        b = linear.intercept;
        render plain: ('%.6f' % a + "," + '%.6f' %  b);        

	
	end 

		

end
