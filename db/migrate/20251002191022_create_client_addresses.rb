class CreateClientAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :client_addresses, id: :uuid do |t|
      t.text :address
      t.string :number
      t.text :city
      t.text :state
      t.text :zip
      t.text :reference
      t.references :client, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
