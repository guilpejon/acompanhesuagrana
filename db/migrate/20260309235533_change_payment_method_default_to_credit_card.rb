class ChangePaymentMethodDefaultToCreditCard < ActiveRecord::Migration[8.1]
  def change
    change_column_default :expenses, :payment_method, from: "cash", to: "credit_card"
  end
end
