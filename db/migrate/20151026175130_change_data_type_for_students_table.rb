class ChangeDataTypeForStudentsTable < ActiveRecord::Migration
  def change  
    change_table :students do |t|  
      t.change :age_group, :string
    end
  end
end
