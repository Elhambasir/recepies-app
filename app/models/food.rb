class Food < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods, foreign_key: 'food_id'
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
