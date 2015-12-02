require 'rails_helper'

describe 'Orders' do
  let!(:product) { create(:product) }

  describe 'Add to cart' do
    it 'adds product to cart', js: true do
      visit '/'
      first('.product-link').click
      click_link 'Add to cart'
      expect(page).to have_content('Added')
    end
  end
end
