module BankAccounts
  class UpdateDailyInterestJob < ApplicationJob
    queue_as :default

    def perform
      return unless BrazilianHolidays.business_day?(Date.current)

      BankAccount.where("interest_rate > 0 OR rate_type = 'cdi_percentage'")
                 .each(&:apply_daily_interest!)
    rescue StandardError => e
      Rails.logger.error "UpdateDailyInterestJob error: #{e.message}"
    end
  end
end
