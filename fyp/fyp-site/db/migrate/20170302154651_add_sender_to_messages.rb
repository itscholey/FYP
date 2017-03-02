class AddSenderToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :sender, index: true, foreign_key: { to_table: :recipients }
  end
end
