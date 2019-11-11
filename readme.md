# Currency Converter
 A simple web application that converts all currency rates from currencylayer API. 
 The history of conversions are stored in Postgresql database and you can see them in the application view with details.


# Prerequisites
 Before you download there are prerequisites you need to make this project work.
 - Install Ruby
 - Install the Bundler Gem after you install Ruby, use `gem install bundler`
 - Install Postgresql
                  

# Setup
## 1.install dependencies
- cd into this project's directory
- Run `bundle install` to install app dependencies
  
## 2.Create a Database
- The project uses Postgresql database.
- Create a database with Name **CurrencyData** or feel free to change the name
- Update database connection path in the file `config/environment.rb`
  
## 3. Run the project
To run the project, simply execute `rackup` in your console
view at: http://localhost:port
   
## 4. Run tests
    simply execute `rspec`

  
