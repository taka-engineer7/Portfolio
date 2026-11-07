class CreateCaves < ActiveRecord::Migration[7.2]
  def change
    create_table :caves do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price
      t.string :address
      t.boolean :wifi
      t.boolean :power_outlet
      t.string :business_hours

      t.timestamps
    end
  end
end
