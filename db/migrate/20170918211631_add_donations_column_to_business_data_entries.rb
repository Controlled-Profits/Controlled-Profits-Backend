class AddDonationsColumnToBusinessDataEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :business_data_entries, :donations, :decimal
  end
end
