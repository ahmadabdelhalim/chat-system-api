class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :access_token, null: false
      t.string :name, null: false, index: true

      t.timestamps
    end
    add_index :applications, :access_token, unique: true
  end
end
