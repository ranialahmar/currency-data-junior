require './config/environment'
require 'money/bank/currencylayer_bank' 
#require './../Currency.rb'
require 'sprockets'
require 'uglifier'
require 'sass'
require 'coffee-script'
require 'execjs'


# For the documentation check http://sinatrarb.com/intro.html
class ApplicationController < Sinatra::Base
	
	
	include Currency
	
	h_api=$api
	background_pic=$picture_bg
	
  
  	configure do
    	set :views, "app/views"
		set :public_dir, "public"
		

	  end
	
	
	#getting all convertions done
	get '/' do
		@ap=h_api
		@conversions = Conversion.all
		@picture=background_pic
		#@convertions.each { |c| puts "to #{c.to}, from #{c.from} with rate #{c.rate}"}
	erb :index
	end
	
	get '/refresh' do
		
		@result= params[:result]
		@date= params[:date]
		@rate = params[:rate]
		@from=params[:from]
		@to=params[:to]
		@ap=h_api
		@picture=background_pic
		@conversions = Conversion.all
		erb :index
	end
	 
end
