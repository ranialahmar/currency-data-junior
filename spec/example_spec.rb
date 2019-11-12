require 'spec_helper'


describe 'ApplicationController' do

  it " Application works!" do
    get '/'
    expect(last_response.status).to eq 200
    expect(last_response.body).to include("Live Currency converter ")
  end
  
  it "History loaded!" do
    get '/History'
    expect(last_response.status).to eq 200
    expect(last_response.body).to include("The history of all conversions ")
  end


end


#test Conversion 
def Calcul(from,to,amount)
  Currency.calculConversion(from,to,amount)
end

describe :Calcul do
    it "should convert the amount " do
      allow(Currency)
      .to receive(:calculConversion)
      .with("EUR","CHF",750)
      .and_return({conversion_result: 824.517, rate:1.09936, date:"2019-11-09 09:44:31"})
  
    end
end  


describe "POST" do
  it "new Conversion is added !" do
        post '/newConversion', params: {from:"AUD",to:"USD",Amount:750,result:824.517,rate:1.09936,conversion_Date:"2019-11-09 09:44:31"}
        expect(last_response.content_type).to eq "text/html;charset=utf-8"
    
  end
end
  


  

