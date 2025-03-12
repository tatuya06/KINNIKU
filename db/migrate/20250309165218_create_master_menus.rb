class CreateMasterMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :master_menus do |t|
      t.string :menu_name
      t.integer :part_kbn

      t.timestamps
    end
  end
end
