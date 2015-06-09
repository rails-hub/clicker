class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :courses
  has_many :user_courses

  before_save :add_search_terms


  private

  def add_search_terms
    self.search_terms = self.first_name.downcase + ' ' + self.last_name.downcase
  end

end
