class Letter < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy, :counter_cache => true
end
