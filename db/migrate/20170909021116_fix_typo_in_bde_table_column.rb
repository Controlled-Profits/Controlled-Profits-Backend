class FixTypoInBdeTableColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :business_data_entries, :accumulated_depriciation, :accumulated_depreciation
  end
end
