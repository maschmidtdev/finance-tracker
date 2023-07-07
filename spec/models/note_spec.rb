require 'rails_helper'

RSpec.describe Note, type: :model do

  describe 'validations' do
    it 'is valid with a user_stock and content' do
      user_stock = create(:user_stock)
      note = build(:note, user_stock: user_stock, content: 'Test note')
      expect(note).to be_valid
    end

    it 'is invalid without a user_stock' do
      note = build(:note, user_stock: nil, content: 'Test note')
      expect(note).to be_invalid
      expect(note.errors[:user_stock]).to include("must exist")
    end

    it 'is invalid without content' do
      user_stock = create(:user_stock)
      note = build(:note, user_stock: user_stock, content: nil)
      expect(note).to be_invalid
      expect(note.errors[:content]).to include("can't be blank")
    end
  end

  it 'is destroyed when user_stock is destroyed' do
    user_stock = create(:user_stock)
    note = create(:note, user_stock: user_stock)

    user_stock.destroy

    expect(Note.exists?(note.id)).to be_falsey
  end

end
