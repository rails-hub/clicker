class CreateInteractiveItems < ActiveRecord::Migration
  def change
    create_table :interactive_items do |t|
      t.references :interactable, polymorphic: true
      t.references :course
      t.references :user
      t.timestamps
    end

    add_index :interactive_items, :course
  end
end
