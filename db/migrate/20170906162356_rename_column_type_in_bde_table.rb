class RenameColumnTypeInBdeTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :business_data_entries, :type, :entry_type
  end
end
