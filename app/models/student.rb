class Student < ActiveRecord::Base
	validates_presence_of :name, :email, :ocuppation, :phone, :cell_phone, :date_course, :hour_course
end
