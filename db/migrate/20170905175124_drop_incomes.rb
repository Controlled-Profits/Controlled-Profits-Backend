class DropIncomes < ActiveRecord::Migration[5.1]
  def change
    drop_table :incomes
  end
end
