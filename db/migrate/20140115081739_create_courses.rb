class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string  :category
      t.text    :agenda
      t.timestamps
    end
  end
end
