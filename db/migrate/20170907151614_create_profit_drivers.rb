class CreateProfitDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :profit_drivers do |t|
      t.string :name
      t.decimal :percent
      t.decimal :var_cost
      t.decimal :fixed_cost
      t.integer :business_id
      t.timestamp :entry_date

      t.timestamps
    end
  end
end
