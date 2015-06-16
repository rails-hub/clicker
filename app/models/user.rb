class User < ActiveRecord::Base

  attr_accessor :login

  rolify

  devise :database_authenticatable,
         # :registerable,:recoverable,
         :rememberable, :trackable, :validatable, :authentication_keys => [:login]


  has_many :courses
  has_many :user_courses, dependent: :destroy
  has_many :interactive_items, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :quizzes, dependent: :destroy
  has_many :polls, dependent: :destroy
  has_many :user_attendances, dependent: :destroy

  before_save :add_search_terms

  validates :username,
            :presence => true,
            :uniqueness => {
                :case_sensitive => false
            }


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def is_present(user_attendances, user)
    if user_attendances.where('user_id = ?', user.id).blank?
      return false
    else
      return true
    end
  end

  private

  def add_search_terms
    self.search_terms = self.first_name.downcase + ' ' + self.last_name.downcase
  end

  def email_required?
    false
  end

end
