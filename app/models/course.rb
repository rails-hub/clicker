class Course < ActiveRecord::Base

  belongs_to :course_creator, class_name: "User"
  has_many :user_courses


  validates :user_id, presence: true
  validates :title, presence: true
  validates :courseId, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :date_cannot_be_in_past

  before_save :add_search_terms


  private

  def add_search_terms
    self.search_terms = self.course_id.downcase + ' ' + self.title.downcase
  end

  def date_cannot_be_in_past
    errors.add(:start_date, "start date can't be in the past") if self.start_date < Date.today
    errors.add(:end_date, "end date can't be in the past") if self.end_date < Date.today
  end

end
