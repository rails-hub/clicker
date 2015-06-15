class UserCourse < ActiveRecord::Base

  belongs_to :course
  belongs_to :user

  validates :user_id, presence: true
  validates :course_id, presence: true

  validate :can_be_registered


  private

  def can_be_registered
    errors.add(:course_id, "You are already registered in this course") unless UserCourse.where('user_id = ? and course_id = ?', self.user_id, self.course_id).blank?
    if Course.where('id = ?', self.course_id).first
      errors.add(:course_id, "Course Limit Reached") if UserCourse.where('course_id = ?', self.course_id).count >= Course.where('id = ?', self.course_id).first.limit
    else
      errors.add(:course_id, "No Such Course Exist")
    end
  end

end
