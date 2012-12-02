class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, default: '', null: false
      t.string :image_url

      t.timestamps
    end
  end
end