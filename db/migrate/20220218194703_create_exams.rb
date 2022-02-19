class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.string :name, limit: 70
      t.boolean :active

      t.timestamps
    end
  end
end
