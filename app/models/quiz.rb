class Quiz < ActiveRecord::Base

  belongs_to :user
  belongs_to :course
  belongs_to :interactive_item

  # validates :type, presence: true
  validates :title, presence: true

end
