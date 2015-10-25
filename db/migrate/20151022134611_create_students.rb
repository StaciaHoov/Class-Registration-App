class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :user_id
      t.integer :age_group

      t.timestamps null: false
    end
  end
end
