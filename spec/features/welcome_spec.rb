require 'rails_helper'

describe 'Welcome' do
  context 'show root page' do
    it 'should display login fields if user not signed in', js: true do
      visit '/'
      expect(page).to have_selector('input#session_email')
      expect(page).to have_selector('input#session_password')
    end
  end

  context 'registration' do
    it 'should successfully register user with correct email/password', js: true do
      visit '/'
      click_link 'Click here'
      fill_in 'user_email', with: 'sergiy@mailinator.com'
      fill_in 'user_password', with: 'p@ssw0rd'
      fill_in 'user_password_confirmation', with: 'p@ssw0rd'
      click_button 'OK'
      sleep 1

      expect(User.last.email).to eq('sergiy@mailinator.com')
    end

    it 'should not register user with not correct passwords', js: true do
      visit '/'
      click_link 'Click here'
      fill_in 'user_email', with: 'sergiy@mailinator.com'
      fill_in 'user_password', with: 'p@ssw0rd'
      fill_in 'user_password_confirmation', with: 'p@ssw0rd1'
      click_button 'OK'

      expect(page).to have_content("doesn't match Password")
      expect(User.all.count).to be(0)
    end

    it 'should not register user with not correct email', js: true do
      visit '/'
      click_link 'Click here'
      fill_in 'user_email', with: 'sergiymailinator.com'
      fill_in 'user_password', with: 'p@ssw0rd'
      fill_in 'user_password_confirmation', with: 'p@ssw0rd'
      click_button 'OK'

      expect(page).to have_content('is invalid')
      expect(User.all.count).to be(0)
    end
  end

  context 'login' do
    it 'should successfully login with', js: true do
      User.create!(
        email: 'sergiy@mailinator.com',
        password: 'p@ssw0rd',
        password_confirmation: 'p@ssw0rd'
      )

      visit '/'
      fill_in 'session_email', with: 'sergiy@mailinator.com'
      fill_in 'session_password', with: 'p@ssw0rd'
      click_button 'OK'

      expect(page).to have_content('sergiy@mailinator.com')
      expect(page).to have_selector('a', text: 'Sign Out')
    end

    it 'should not login with wrong email/password', js: true do
      visit '/'

      fill_in 'session_email', with: 'sergiy@mailinator.com'
      fill_in 'session_password', with: 'p@ssw0rd'
      click_button 'OK'

      expect(page).to have_content('Invalid email or pass')
    end

    it 'should not login with empty password', js: true do
      visit '/'

      fill_in 'session_email', with: 'sergiy@mailinator.com'
      fill_in 'session_password', with: ''
      click_button 'OK'

      expect(page).to have_content("can't be blank")
    end
  end

end
