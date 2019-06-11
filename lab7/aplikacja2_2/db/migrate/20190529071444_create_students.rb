class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.integer :rok
      t.boolean :can_edit

      t.timestamps
    end
  end
end
