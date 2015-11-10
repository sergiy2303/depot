require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:user_1) { create(:unconfirmed_user) }

  it 'sends an email' do
    expect { user.send_instructions! }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it 'confirms user' do
    user_1.confirm!

    expect(user_1.confirmed).to be_truthy
  end
end
