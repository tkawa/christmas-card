class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, default: '', null: false
      t.references :card, null: false
      t.references :member, null: false

      t.timestamps
    end
    add_index :comments, :card_id
    add_index :comments, :member_id
  end
end
