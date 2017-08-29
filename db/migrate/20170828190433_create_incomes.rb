class CreateIncomes < ActiveRecord::Migration[5.1]
  def change
    create_table :incomes do |t|
      t.integer :business_id
      t.decimal :period_sales
      t.decimal :cash_collections
      t.decimal :credit_sales
      t.timestamp :entry_date

      t.timestamps
    end
  end
end
