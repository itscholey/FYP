class RenamePasswordToPasswordDigestInUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password, :string
    add_column :users, :password_digest, :string
  end

  def down
    remove_column :users, :password_digest, :string
    add_column :users, :password, :string
  end
end
