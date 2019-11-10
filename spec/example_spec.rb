require 'spec_helper'

describe 'ApplicationController' do

  it "works!" do
    get '/'
    expect(last_response.status).to eq 200
    expect(last_response.body).to include("Live Currency Converter")
  end


end


def Calcul(from,to,amount)
  Currency.calculConversion(from,to,amount)
end

describe :Calcul do
    it "should convert the amount " do
      allow(Currency).to receive(:calculCconversion).with("EUR","CHF",750).and_return({conversion_result: 824.517, rate:1.09936, date:"2019-11-09 09:44:31"})
  
    end
end
  

