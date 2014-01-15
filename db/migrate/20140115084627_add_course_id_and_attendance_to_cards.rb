class AddCourseIdAndAttendanceToCards < ActiveRecord::Migration
  def change
    add_column :cards, :course_id, :integer
    add_column :cards, :attendance, :text
  end
end
