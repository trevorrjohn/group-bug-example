class CreateBars < ActiveRecord::Migration[5.1]
  def change
    create_table :bars do |t|
      t.integer :name
      t.integer :foo_id, null: false

      t.timestamps
    end
  end
end
