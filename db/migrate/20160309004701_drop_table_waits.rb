class DropTableWaits < ActiveRecord::Migration
  def change
    drop_table :waits
  end
end
