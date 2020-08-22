class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.text :message
      t.decimal :amount
      t.references :customer, foreign_key: true
      t.references :gift, foreign_key: true

      t.timestamps
    end
  end
end
