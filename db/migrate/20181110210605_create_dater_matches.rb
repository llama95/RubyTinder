class CreateDaterMatches < ActiveRecord::Migration
  def change
    create_table :dater_matches do |t|
      t.integer :judger_id
      t.integer :judgee_id

      t.timestamps null: false
    end
  end
end
