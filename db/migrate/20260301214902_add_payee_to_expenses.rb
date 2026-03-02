class AddPayeeToExpenses < ActiveRecord::Migration[8.1]
  def change
    add_reference :expenses, :payee, null: true, foreign_key: true
  end
end
