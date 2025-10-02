class CreateUserProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :user_profiles, id: :uuid do |t|
      t.string :name
      t.text :email
      t.date :birthdate
      t.text :phone
      t.string :gender
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
