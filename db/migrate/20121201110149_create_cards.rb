class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :status, default: 'in_progress', null: false
      t.references :destination, null: false

      t.timestamps
    end
    add_index :cards, :destination_id
  end
end
