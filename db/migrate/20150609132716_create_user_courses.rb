class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.references :user
      t.references :course
      t.timestamps
    end
  end
end
