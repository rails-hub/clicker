class AddColumnsToUserAttendance < ActiveRecord::Migration
  def change
    add_column :user_attendances, :attendance_id, :integer

	  add_index  :user_attendances, :attendance_id
  end

end
