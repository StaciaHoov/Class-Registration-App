class ChangeDataTypeForFeeColumn < ActiveRecord::Migration
  def change  
    change_table :courses do |t|  
      t.change :fee, :decimal, :precision => 19, :scale => 4
    end
  end
end

