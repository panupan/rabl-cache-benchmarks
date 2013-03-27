class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :manager
      t.string :name
      t.text :profile
      t.integer :age

      t.timestamps
    end
    add_index :employees, :manager_id
  end
end
