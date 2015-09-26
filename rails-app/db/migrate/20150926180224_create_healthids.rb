class CreateHealthids < ActiveRecord::Migration
  def change
    create_table :healthids do |t|
      t.string
      t.text :hash, null: false, unique: true
      t.string :health_id, null: false, unique: true
      t.string :fname, null: false
      t.string :lname, null: false
      t.column :photo, :oid, null: false
      t.timestamps null: false
    end
  end
end
