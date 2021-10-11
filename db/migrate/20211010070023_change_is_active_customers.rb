class ChangeIsActiveCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column(:customers, :is_active, :boolean, null: false, default: true)
  end
end
