class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :name, :null => false
    	t.string :email
    	t.string :ocuppation
    	t.string :phone
    	t.string :cell_phone

      t.timestamps null: false
    end
  end
end
