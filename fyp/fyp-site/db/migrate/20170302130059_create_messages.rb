class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :Conversation, index: true, foreign_key: true
      t.string :body
      t.boolean :read

      t.timestamps null: false
    end
  end
end
