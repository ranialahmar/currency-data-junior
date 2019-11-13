require 'money/bank/currencylayer_bank' 

class ConversionController < ApplicationController
	
	include Currency
	
	post'/newConversion' do
		
		#getting data from inputs
		@Amount=params[:Amount].to_f
		@from=params[:from]
		@to=params[:to]
		
		#Conversion_result
		h_result = calculConversion(@from, @to, @Amount)
		
		#result details 
		@result=h_result[:conversion_result].to_f
		@date=h_result[:date]
		@rate=h_result[:rate].to_f

		#add the new conversion in the database
		@new_conversion=Conversion.new(from: @from,to:@to,Amount:@Amount,result:@result,rate:@rate,conversion_Date:@date)
		
		if @new_conversion.save 
			puts "new Conversion is done"
		else
			puts "Please ensure you have filled in all required fields correctly!"
		end
		
		
			
		redirect "/refresh?result=#{@result}&rate=#{@rate}&Amount=#{@Amount}&date=#{@date}&from=#{@from}&to=#{@to}"
	
	end 
	
	
	
	
	
		
	
end
