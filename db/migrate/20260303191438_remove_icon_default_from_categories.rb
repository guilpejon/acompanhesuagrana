class RemoveIconDefaultFromCategories < ActiveRecord::Migration[8.1]
  def change
    change_column_default :categories, :icon, from: "💰", to: nil
  end
end
