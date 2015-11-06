require 'rails_helper'

describe 'Users' do
  let(:attrs) { attributes_for(:user) }
  let!(:user) { create(:user) }
  let(:user_2) { create(:unconfirmed_user) }

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

  describe 'Sign In' do
    it 'logins user', js: true do
      visit '/'
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

    it 'try to login unconfirmed user' do
      visit '/'
      click_link 'Sign in'
      within '#new_session' do
        fill_in 'Email', with: user_2.email
        fill_in 'Password', with: user_2.password
      end
      click_button(:OK)
      expect(page).to have_content('Your email is not confirmed')
    end
  end
end
