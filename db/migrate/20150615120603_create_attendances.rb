class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :user
      t.references :course
      t.references :interactive_item
      t.timestamps
    end

  end
end
