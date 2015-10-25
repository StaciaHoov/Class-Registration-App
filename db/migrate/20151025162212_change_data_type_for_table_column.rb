class ChangeDataTypeForTableColumn < ActiveRecord::Migration
  def change
    change_table :courses do |t|  
      t.change :time_block, :string
    end
  end
end

