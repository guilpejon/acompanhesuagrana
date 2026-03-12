class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :nullify

  validates :name, presence: true, length: { maximum: 20 }
  validates :color, presence: true
  validates :icon, presence: true
end
