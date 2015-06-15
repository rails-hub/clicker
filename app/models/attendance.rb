class Attendance < ActiveRecord::Base

  belongs_to :user
  belongs_to :course
  belongs_to :interactive_item

end
