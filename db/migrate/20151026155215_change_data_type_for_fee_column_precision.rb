class ChangeDataTypeForFeeColumnPrecision < ActiveRecord::Migration
  def change  
    change_table :courses do |t|  
      t.change :fee, :decimal, :precision => 10, :scale => 2
    end
  end
end
