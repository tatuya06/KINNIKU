class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :youbi_kbn
      t.integer :menu_id
      t.integer :menu_rep
      t.integer :count
      t.integer :weight

      t.timestamps
    end
  end
end
