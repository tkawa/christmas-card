class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :email, default: '', null: false
      t.string :name, default: '', null: false

      t.timestamps
    end
  end
end
