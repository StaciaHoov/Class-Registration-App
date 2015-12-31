class ChangeAgeColumnforStudentsTable < ActiveRecord::Migration
  def change  
    change_table :students do |t|  
      t.change :age, :integer
    end
  end
end
