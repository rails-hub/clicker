class UserCourse < ActiveRecord::Base

  belongs_to :course
  belongs_to :user

  validates :user_id, presence: true
  validates :course_id, presence: true

  validate :can_be_registered


  private

  def can_be_registered
    errors.add(:is_registered, "You are already registered in this course") unless self.where('user_id = ? and course_id = ? and is_registered = ?', self.user_id, self.course_id, true).blank?
    errors.add(:is_registered, "Course Limit Reached") if self.where('course_id = ? and is_registered = ?', self.course_id, true).count >= Course.where('course_id = ?', self.course_id).limit
  end

end
