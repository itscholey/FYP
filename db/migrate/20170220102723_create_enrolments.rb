class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.references :student, index: true, foreign_key: { to_table: :users }
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
