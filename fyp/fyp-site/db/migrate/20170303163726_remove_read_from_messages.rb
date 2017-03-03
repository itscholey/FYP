class RemoveReadFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :read
  end

  def down
    add_column :messages, :read, :boolean
  end
end
