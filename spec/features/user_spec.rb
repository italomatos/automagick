require 'rails_helper'

RSpec.describe User, type: :feature do
  context 'com uma conta gratuita' do
    it 'não pode ter mais que 5 cron requests ativos' do 
      user = create(:user)
      10.times { user.cron_requests << create(:cron_request) }
      user.save!
      expect(user.cron_requests.count).to eq(5)
    end 
  end
end
