class CreatePermanentCookie < ActiveRecord::Migration
  def change
    create_table :permanent_cookies do |t|
      t.string :location, null: false
      t.string :device, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    add_index :permanent_cookies, :user_id
  end
end
