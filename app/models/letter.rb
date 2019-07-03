class Letter < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy, foreign_key: 'letter_id', :counter_cache => :likes_count
  has_many :saved_letter, dependent: :destroy
  has_one :today_letter, dependent: :destroy
end
