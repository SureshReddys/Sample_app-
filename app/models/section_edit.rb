class SectionEdit < ActiveRecord::Base
	belongs_to :Section
	belongs_to :editor, :class_name =>"AdminUser",:foreign_key => "admin_user_id"
end
