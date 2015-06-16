class Attendance < ActiveRecord::Base

  belongs_to :user
  belongs_to :course
  belongs_to :interactive_item

  has_many :user_attendances, :dependent => :destroy

end
