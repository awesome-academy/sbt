class AddDeletedAtToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :deleted_at, :datetime
    add_index :accounts, :deleted_at
  end
end
