class Like < ApplicationRecord
    belongs_to :user, foreign_key: 'user_id'
    belongs_to :letter, foreign_key: 'letter_id', counter_cache: true
end
