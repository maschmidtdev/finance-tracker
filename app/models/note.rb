class Note < ApplicationRecord
  belongs_to :user_stock

  validates :content, presence: true
  validates :user_stock_id, uniqueness: true
end
