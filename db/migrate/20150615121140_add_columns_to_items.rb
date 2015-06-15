class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :interactive_items, :for_date, :date

	  add_index  :interactive_items, :for_date
  end

end
