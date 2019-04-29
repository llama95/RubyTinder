class CreateDaters < ActiveRecord::Migration
  def change
    create_table :daters do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :phone_number
      t.string :gender
      t.integer :age

      t.timestamps null: false
    end
    add_index :daters, :username, unique: true
  end
end
