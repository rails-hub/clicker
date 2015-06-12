class AddUsernameToUser < ActiveRecord::Migration
  def change
    enable_extension :hstore
    add_column :users, :username, :string

	  add_index  :users, :username
  end

end
