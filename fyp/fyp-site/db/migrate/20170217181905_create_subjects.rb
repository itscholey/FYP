class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.string :classGroup, null: false
      t.references :teacher, index: true, foreign_key: { to_table: :users }

      t.timestamps null: false
    end
  end
end
