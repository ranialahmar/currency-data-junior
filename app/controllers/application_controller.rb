require './config/environment'
require 'money/bank/currencylayer_bank' 
#require './../Currency.rb'
require 'sprockets'
require 'uglifier'
require 'sass'
require 'coffee-script'
require 'execjs'

class ApplicationController < Sinatra::Base
	
	
	#load all api data 
	data_api=$api
	

  	configure do
    	set :views, "app/views"
		set :public_dir, "public"
		pictures=Dir.glob("public/assets/img/*.{jpg,JPG}")
        pictures.each{ |p|
            $picture_bg=p.sub!(/public\//, '') 
        }
		
	end
	

	
	
	#getting all conversions from database
	get '/' do
		@ap=data_api
		@conversions = Conversion.all
		@picture=$picture_bg
		
	erb :index
	
    end
	
	
	
	#refreshing the view after conversion with details
	get '/refresh' do
		@result= params[:result]
		@date= params[:date]
		@rate = params[:rate]
		@Amount=params[:Amount]
		@from=params[:from]
		@to=params[:to]
		@ap=data_api
		@picture=$picture_bg
		
		erb :index

	end
	
	#get all conversions done
	get '/History' do
		@conversions = Conversion.all
		erb :history
		
	end
	 
end
