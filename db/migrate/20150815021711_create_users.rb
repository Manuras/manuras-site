class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :salt
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
