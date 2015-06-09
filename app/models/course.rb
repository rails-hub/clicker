class Course < ActiveRecord::Base

  belongs_to :course_creator , class_name: "User"


  before_save :add_search_terms


  private

  def add_search_terms
    self.search_terms = self.course_id.downcase + ' ' + self.title.downcase
  end

end
