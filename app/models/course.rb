class Course < ActiveRecord::Base

  belongs_to :course_creator, class_name: "User"
  has_many :user_courses
  has_many :interactive_items, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true, :uniqueness => true
  # validates :courseId, presence: true, :uniqueness => true
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validate :date_cannot_be_in_past

  before_save :add_search_terms


  private

  def add_search_terms
    # self.search_terms = self.courseId.downcase + ' ' + self.title.downcase
    self.search_terms = self.title.downcase
  end

  def date_cannot_be_in_past
    errors.add(:start_date, "start date can't be in the past") if self.start_date < Date.today
    errors.add(:end_date, "end date can't be in the past") if self.end_date < Date.today
  end


end
