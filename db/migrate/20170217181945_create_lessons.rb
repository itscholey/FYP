class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.datetime :date, null: false
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
