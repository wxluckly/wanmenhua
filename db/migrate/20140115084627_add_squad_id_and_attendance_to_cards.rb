class AddSquadIdAndAttendanceToCards < ActiveRecord::Migration
  def change
    add_column :cards, :squad_id, :integer
    add_column :cards, :attendance, :text
  end
end
