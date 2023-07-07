class Note < ApplicationRecord
  belongs_to :user_stock

  validates :content, presence: true
end
