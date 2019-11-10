# Setting the app envirement
ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"
# Add the needed requirement to boot the app
#require 'rack-flash'
require 'bundler/setup'
require 'rubygems'
require 'data_mapper'

$api_key='23d4aeb4aef6f27cabe822afdcc05b4b'

Bundler.require(:default, ENV['SINATRA_ENV'])

# Setting DataMapper database connection
# Having trouble with database or you want to change the adapter ?! check https://datamapper.org/getting-started.html
DataMapper.setup(:default, 'postgres://rania_psql:rania123@localhost:5432/CurrencyData')
# Loading all the files in app folder
require_all 'app'

#checking basic validity
DataMapper.finalize


