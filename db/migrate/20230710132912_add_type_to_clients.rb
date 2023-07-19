class AddTypeToClients < ActiveRecord::Migration[7.0]
  def change
    add_reference :clients, :type, null: false, foreign_key: true
  end
end
