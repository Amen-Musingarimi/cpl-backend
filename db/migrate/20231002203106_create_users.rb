class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.date :date_of_birth
      t.string :national_id_number
      t.string :team
      t.string :team_role
      t.string :password_digest
      t.integer :phone_number

      t.timestamps
    end
  end
end
