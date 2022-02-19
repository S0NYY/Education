class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name, limit: 70
      t.boolean :active

      t.timestamps
    end
  end
end
