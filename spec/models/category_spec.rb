require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category) { create(:category) }

  describe '#to_param' do
    it 'returns slug' do
      expect(category.to_param).to eql(category.title.parameterize)
    end
  end
end
