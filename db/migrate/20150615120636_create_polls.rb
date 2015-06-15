class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.references :user
      t.references :course
      t.references :interactive_item
      t.string :title
      t.timestamps
    end

    add_index :polls, :title
  end
end
