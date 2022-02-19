class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name, limit: 70
      t.boolean :active

      t.timestamps
    end
  end
end
