class InteractiveItem < ActiveRecord::Base

  belongs_to :interactable, polymorphic: true
  belongs_to :user
  belongs_to :course

  has_many :attendances, :dependent => :destroy
  has_many :quizzes, :dependent => :destroy
  has_many :polls, :dependent => :destroy
  has_many :user_attendances, dependent: :destroy

  validates :interactable_id, presence: true
  validates :interactable_type, presence: true
  validates :course_id, presence: true
  validates :user_id, presence: true
  validates :for_date, presence: true

  INTERACTIVE_TYPES = ["ATTENDANCE", "QUIZ", "POLL"]


  def build_item(type ,klass, user, item_params, course)
    if type === "Attendance"
      klass.new(course: course, user: user)
    elsif type === "Quiz"
      klass.new(course: course, user: user, :title => item_params[:title].to_s, :time_limit => item_params[:time_limit].to_i)
    elsif type === "Poll"
      klass.new(course: course, user: user, :title => item_params[:title].to_s)
    end
  end

end
