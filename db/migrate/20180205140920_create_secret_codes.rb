class CreateSecretCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :secret_codes do |t|
      t.integer :user_id
      t.string :code_string

      t.timestamps
    end
  end
end
