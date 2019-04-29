class CreateJoinTableDatersInterests < ActiveRecord::Migration
  def change
    create_join_table :daters, :interests do |t|
      # t.index [:dater_id, :interest_id]
      # t.index [:interest_id, :dater_id]
    end
  end
end
