require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #confirmation' do
    let(:user) { create(:unconfirmed_user) }

    it 'user should successfuly activate' do
      get :confirmation, token: user.create_token
      user.reload

      expect(user.confirmed).to be_truthy
      expect(response).to redirect_to(root_path)
    end

    it 'wrong token should redirect to root page' do
      get :confirmation, token: 'asdh443t4tw'

      expect(response).to redirect_to(root_path)
    end
  end
end
