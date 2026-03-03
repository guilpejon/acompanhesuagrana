class BankAccount < ApplicationRecord
  belongs_to :user

  TYPES = %w[checking savings other].freeze
  COLORS = ColorPalette::COLORS
  RATE_TYPES = %w[fixed cdi_percentage].freeze

  validates :name, presence: true
  validates :account_type, inclusion: { in: TYPES }
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :interest_rate, numericality: { greater_than_or_equal_to: 0 }
  validates :rate_type, inclusion: { in: RATE_TYPES }
  validates :cdi_multiplier, numericality: { greater_than: 0 }, if: :cdi_percentage?

  def cdi_percentage?
    rate_type == "cdi_percentage"
  end

  def effective_rate
    if cdi_percentage?
      (CdiRate.current || 0) * cdi_multiplier / 100
    else
      interest_rate
    end
  end

  def monthly_interest
    balance * effective_rate / 100 / 12
  end

  def yearly_interest
    balance * effective_rate / 100
  end
end
