class AddDoeslikeToDaterMatch < ActiveRecord::Migration
  def change
    add_column :dater_matches, :doeslike, :boolean
  end
end
