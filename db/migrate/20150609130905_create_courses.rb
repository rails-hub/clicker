class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_id
      t.string :title
      t.references :user
      t.text :search_terms
      t.integer :limit

      t.timestamps
    end
    add_index  :courses, :title
    add_index  :courses, :course_id
    add_index  :users, :search_terms
  end
end
