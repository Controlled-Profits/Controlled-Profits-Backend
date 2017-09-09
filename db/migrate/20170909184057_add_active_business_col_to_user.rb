class AddActiveBusinessColToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :active_business_id, :integer
  end
end
