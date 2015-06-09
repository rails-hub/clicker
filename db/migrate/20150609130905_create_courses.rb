class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :courseId
      t.string :title
      t.references :user
      t.text :search_terms
      t.boolean :is_registered, :default => true
      t.integer :limit, :default => 1000
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index  :courses, :title
    add_index  :courses, :course_id
    add_index  :users, :search_terms
  end
end
