class AddCountryAndActiveToClientAddresses < ActiveRecord::Migration[8.0]
  def change
    add_column :client_addresses, :country, :string
    add_column :client_addresses, :active, :boolean, default: :true
  end
end
