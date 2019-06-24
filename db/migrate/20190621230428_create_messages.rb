class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :chat, foreign_key: true
      t.integer :message_number, null: false, default: 0, index: true
      t.string :body, null: false, index: true

      t.timestamps
    end
    add_index :messages, [:chat_id, :message_number], unique: true
  end
end
