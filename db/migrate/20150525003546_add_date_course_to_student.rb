class AddDateCourseToStudent < ActiveRecord::Migration
  def change
    add_column :students, :date_course, :string
  end
end
