class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :application, null:false, foreign_key: true
      t.integer :chat_number, null: false, default: 0, index: true

      t.timestamps
    end
    add_index :chats, [:application_id, :chat_number], unique: true
  end
end
