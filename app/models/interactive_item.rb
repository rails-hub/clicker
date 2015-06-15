class InteractiveItem < ActiveRecord::Base

  belongs_to :interactable, polymorphic: true
  belongs_to :user
  belongs_to :course

  has_many :attendances, :dependent => :destroy
  has_many :quizzes, :dependent => :destroy
  has_many :polls, :dependent => :destroy

  validates :interactable_id, presence: true
  validates :interactable_type, presence: true
  validates :course_id, presence: true
  validates :user_id, presence: true
  validates :for_date, presence: true

  INTERACTIVE_TYPES = ["ATTENDANCE", "QUIZ", "POLL"]



end
