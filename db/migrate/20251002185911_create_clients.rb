class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :name
      t.date :birthdate
      t.text :phone
      t.text :description
      t.boolean :active
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
