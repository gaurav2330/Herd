class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :email
      t.date   :date_of_birth
      t.text   :phone_number

      t.timestamps
    end
  end
end
