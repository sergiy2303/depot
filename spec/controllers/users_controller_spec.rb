require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #confirmation' do
    let(:user) { create(:unconfirmed_user) }

    it 'user should successfuly activate' do
      get :confirmation, token: user.create_token
      user.reload

      expect(user.confirmed).to be_truthy
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Your account has been successfully confirmed.')
    end

    it 'wrong token should redirect to root page' do
      get :confirmation, token: 'asdh443t4tw'

      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq('Invalid token.')
    end
  end
end
