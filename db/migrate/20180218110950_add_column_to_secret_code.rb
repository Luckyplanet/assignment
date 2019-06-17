class AddColumnToSecretCode < ActiveRecord::Migration[5.1]
  def change
    add_column :secret_codes, :payload, :jsonb
  end
end
