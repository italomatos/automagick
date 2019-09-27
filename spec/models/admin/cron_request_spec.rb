require 'rails_helper'

RSpec.describe Admin::CronRequest, type: :model do
  

  context 'when invalid url' do
  	it 'is not valid' do 
  		cron = create(:cron_request)
  		cron.url = 'url invalida'
  		expect(cron).to be_invalid
  	end
  end
end
