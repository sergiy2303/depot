require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'instructions' do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.welcome_email(user) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Plase confirm your email')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['depotcom1@gmail.com'])
    end
  end
end
