require 'rails_helper'
require 'uri'

describe 'Users' do
  let(:attrs) { attributes_for(:user) }
  let!(:user) { create(:user) }
  let(:mail) { UserMailer.signup_confirmation(user) }

  describe 'Sign Up' do
    it 'registers user', js: true do
      visit '/'
      click_link 'Click here'
      click_button(:OK)
      expect(page).to have_content("can't be blank")
      within '#new_user' do
        fill_in 'Email', with: attrs[:email]
        fill_in 'Password', with: attrs[:password]
        fill_in 'Password confirmation', with: attrs[:password]
      end
      click_button(:OK)
      expect(page).to have_content('Hello!')
    end
  end

  describe 'Confirm email' do
    it 'confirms user email', js: true do
      visit '/'
      click_link 'Sign in'
      within '#new_session' do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button(:OK)
      expect(page).to have_content('Please confirm your email')
      visit "/user/confirm?token=#{user.confirmation_token}"
      expect(page).to have_content('Hello!')
      user.reload
      expect(user.confirmed).to be true
    end
    it 'redirects to root page when wrong token' do
      visit '/user/confirm?token=2wdfs434rsdf4wr34f'
      expect(page).to have_content('Hello!')
    end
  end

  describe 'Sign In' do
    it 'logins user', js: true do
      visit "/user/confirm?token=#{user.confirmation_token}"
      click_link 'Sign in'
      click_button(:OK)
      expect(page).to have_content("can't be blank")
      within '#new_session' do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
      click_button(:OK)
      expect(page).to have_content('Sign Out')
      click_link 'Sign Out'
      expect(page).to have_content('Hello!')
    end
  end
end
