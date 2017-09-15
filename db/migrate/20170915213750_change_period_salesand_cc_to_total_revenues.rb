class ChangePeriodSalesandCcToTotalRevenues < ActiveRecord::Migration[5.1]
  def change
    remove_column :business_data_entries, :period_sales
    remove_column :business_data_entries, :cash_collections
    add_column :business_data_entries, :total_revenues, :decimal
  end
end
