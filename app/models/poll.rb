class Poll < ActiveRecord::Base

  belongs_to :user
  belongs_to :course
  belongs_to :interactive_item

  validates :title, presence: true, :uniqueness => true

end
