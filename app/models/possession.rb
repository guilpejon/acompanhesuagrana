class Possession < ApplicationRecord
  TYPES = %w[vehicle electronics real_estate furniture jewelry other].freeze
  COLORS = BankAccount::COLORS

  belongs_to :user

  validates :name, presence: true
  validates :possession_type, inclusion: { in: TYPES }
  validates :purchase_price, :current_value, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def value_change
    return nil unless purchase_price && current_value
    current_value - purchase_price
  end

  def value_change_percent
    return nil unless purchase_price&.positive? && current_value
    ((current_value - purchase_price) / purchase_price * 100).round(2)
  end
end
