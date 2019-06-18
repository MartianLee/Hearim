class Letter < ApplicationRecord
    belongs_to :user, counter_cache: true
    has_many :likes
end
