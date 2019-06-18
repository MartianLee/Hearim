class User < ApplicationRecord
    has_many :letters
    has_many :likes
end
