class FixEmployeeName < ActiveRecord::Migration
  def change
    remove_column :members, :name
    remove_column :members, :employee
    add_column :members, :employee_name, :string
  end
end
