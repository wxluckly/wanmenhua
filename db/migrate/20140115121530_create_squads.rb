class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|
      t.string  :name
      t.string  :course
      t.text    :agenda
      t.timestamps
    end
  end
end
