class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body, default: '', null: false
      t.references :card, null: false
      t.references :member, null: false

      t.timestamps
    end
    add_index :messages, :card_id
    add_index :messages, :member_id
  end
end
