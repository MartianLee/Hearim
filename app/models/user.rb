class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :assign_default_role
  def assign_default_role
    add_role(:humen)
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :letters, dependent: :destroy, foreign_key: 'user_id'
  has_many :saved_letters, dependent: :destroy
end
