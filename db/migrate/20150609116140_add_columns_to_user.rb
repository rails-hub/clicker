class AddColumnsToUser < ActiveRecord::Migration
  def change
    enable_extension :hstore
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :search_terms, :text

	  add_index  :users, :search_terms
  end

end
