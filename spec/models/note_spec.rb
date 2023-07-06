require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'validations' do
    it 'is valid with a user, stock, and content' do
      user = create(:user)
      stock = create(:stock)
      note = build(:note, user: user, stock: stock, content: 'Test note')
      expect(note).to be_valid
    end

    it 'is invalid without a user' do
      stock = create(:stock)
      note = build(:note, user: nil, stock: stock, content: 'Test note')
      expect(note).to be_invalid
      expect(note.errors[:user]).to include("must exist")
    end

    it 'is invalid without a stock' do
      user = create(:user)
      note = build(:note, user: user, stock: nil, content: 'Test note')
      expect(note).to be_invalid
      expect(note.errors[:stock]).to include("must exist")
    end

    it 'is invalid without content' do
      user = create(:user)
      stock = create(:stock)
      note = build(:note, user: user, stock: stock, content: nil)
      expect(note).to be_invalid
      expect(note.errors[:content]).to include("can't be blank")
    end
  end
end

