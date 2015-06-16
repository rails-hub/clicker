class UserAttendance < ActiveRecord::Base

  belongs_to :user
  belongs_to :interactive_item
  belongs_to :attendance

end
