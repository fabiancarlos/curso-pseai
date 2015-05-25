class AddHourCourseToStudent < ActiveRecord::Migration
  def change
    add_column :students, :hour_course, :string
  end
end
