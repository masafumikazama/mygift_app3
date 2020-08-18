class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.string :title
      t.decimal :target_price
      t.text :description
      t.references :registry, foreign_key: true

      t.timestamps
    end
  end
end
