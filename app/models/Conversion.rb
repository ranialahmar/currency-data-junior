# this is a simple model example
# check https://datamapper.org/getting-started.html
class Conversion
	include DataMapper::Resource

	property :id,                   Serial    # An auto-increment integer key
	property :from,                 String    # A varchar type string, for short strings
	property :to,                   String 
	property :Amount,               Numeric 
	property :result,               Numeric 
	property :rate,                 Numeric 
	property :conversion_Date,      DateTime
	
	
end

