class RenameUserToSalesman < ActiveRecord::Migration
  def change
    rename_column :customers, :user_id, :salesman_id
  end
end
