class RemoveRoleFromAdmin < ActiveRecord::Migration[5.0]
  def change
  	remove_column :admins, :role
  end
end
