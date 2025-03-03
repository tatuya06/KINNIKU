class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :password
      t.string :mail_address
      t.integer :weight
      t.integer :hight

      t.timestamps
    end
  end
end
