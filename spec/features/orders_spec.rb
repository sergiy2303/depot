require 'rails_helper'

describe 'Orders' do
  let!(:product) { create(:product) }

  describe 'Add to cart' do
    it 'adds product to cart', js: true do
      visit '/'
      first('.product-link').click
      fill_in 'quantity', with: '2'
      click_button 'Add to cart'
      expect(page).to have_content('Cart 1')
      click_link 'Cart 1'
      expect(page).to have_content("#{product.name}")
      expect(page).to have_content("#{product.price}")
      expect(page).to have_content("Total: #{product.price * 2}")
      fill_in 'quantity', with: '4'
      expect(page).to have_content("Total: #{product.price * 4}")
    end
  end
end
