class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name, limit: 70
      t.string :last_name, limit: 70
      t.string :pin, limit: 20
      t.string :mobile_phone, limit: 70
      t.date :birth_date

      t.timestamps
    end
  end
end
