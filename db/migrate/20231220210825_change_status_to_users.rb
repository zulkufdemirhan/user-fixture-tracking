class ChangeStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :status, :string, limit: 15, default: "active"
  end
end