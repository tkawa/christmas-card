class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :name, default: '', null: false
      t.text :body, default: '', null: false
      t.references :card, null: false

      t.timestamps
    end
    add_index :replies, :card_id
  end
end
