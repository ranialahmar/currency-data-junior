require 'money/bank/currencylayer_bank' 

module Currency
             
            $mclb = Money::Bank::CurrencylayerBank.new
            $mclb.access_key =$api_key
            $mclb.cache = 'cache'
            $api=$mclb.update_rates(false)
            Money.default_bank = $mclb
            I18n.enforce_available_locales=false
            
            pictures=Dir.glob("public/assets/img/*.{jpg,JPG}")
            pictures.each{ |p|
             $picture_bg=p.sub!(/public\//, '') 
            }
            
        def calculConversion(from,to,amount)
            
            time = Time.new
            values = time.to_a
            date = Time.utc(*values)
            rate = $mclb.get_rate(from , to )
            conv_result = Money.new(amount.to_f*100, from).exchange_to(to).to_f
            result ={conversion_result: conv_result, rate:rate, date:date}
            return result
        end


    
end