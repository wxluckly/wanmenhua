class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string  :sn
      t.string  :category
      t.timestamps
    end
  end
end
