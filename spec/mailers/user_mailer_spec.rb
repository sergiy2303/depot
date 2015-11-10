require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'signup_confirmation' do
    let(:attrs) { attributes_for(:user) }
    let!(:user) { create(:user) }
    let(:mail) { UserMailer.signup_confirmation(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Sign up confirmation')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['geekhub.depot@gmail.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match("Welcom to geekhub depot, #{user.email}")
      expect(mail.body.encoded).to have_content("#{root_url}user/confirm?token=#{user.confirmation_token}")
    end
  end
end
