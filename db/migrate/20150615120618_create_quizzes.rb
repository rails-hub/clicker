class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.references :user
      t.references :course
      t.references :interactive_item
      t.string :title
      t.string :type
      t.integer :time_limit , :default => nil
      t.timestamps
    end

    add_index :quizzes, :title
  end
end
