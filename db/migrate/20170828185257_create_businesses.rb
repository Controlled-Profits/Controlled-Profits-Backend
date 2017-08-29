class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.integer :user_id
      t.string :name
      t.string :naics
      t.string :sic
      t.string :ein
      t.integer :tier

      t.timestamps
    end
  end
end
