class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses, dependent: :nullify

  before_destroy :clear_user_default

  validates :name, presence: true, length: { maximum: 20 }
  validates :color, presence: true
  validates :icon, presence: true

  private

  def clear_user_default
    user.update_column(:default_category_id, nil) if user.default_category_id == id
  end
end
