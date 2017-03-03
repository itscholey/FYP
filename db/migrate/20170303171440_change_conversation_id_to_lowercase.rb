class ChangeConversationIdToLowercase < ActiveRecord::Migration
  def change
    remove_column :messages, :Conversation_id
    remove_column :recipients, :Conversation_id
    add_reference :messages, :conversation, index: true
    add_reference :recipients, :conversation, index: true
  end
end
