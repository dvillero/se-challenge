class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.datetime :date
      t.string :category
      t.string :employee
      t.string :name
      t.string :employee_address
      t.string :expense_description
      t.float :pre_tax_amount
      t.string :tax_name
      t.float :tax_amount

      t.timestamps null: false
    end
  end
end
