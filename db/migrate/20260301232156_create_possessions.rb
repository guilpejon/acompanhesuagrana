class CreatePossessions < ActiveRecord::Migration[8.1]
  def change
    create_table :possessions do |t|
      t.string :name, null: false
      t.string :possession_type, null: false, default: "other"
      t.decimal :purchase_price, precision: 10, scale: 2
      t.decimal :current_value, precision: 10, scale: 2
      t.date :purchase_date
      t.string :currency, default: "BRL"
      t.string :color, default: "#6C63FF"
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
