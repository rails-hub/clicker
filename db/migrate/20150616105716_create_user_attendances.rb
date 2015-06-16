class CreateUserAttendances < ActiveRecord::Migration
  def change
    create_table :user_attendances do |t|
      t.references :user
      t.references :interactive_item
      t.timestamps
    end
  end
end
