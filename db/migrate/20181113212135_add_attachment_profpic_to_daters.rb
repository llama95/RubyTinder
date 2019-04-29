class AddAttachmentProfpicToDaters < ActiveRecord::Migration
  def self.up
    change_table :daters do |t|
      t.attachment :profpic
    end
  end

  def self.down
    remove_attachment :daters, :profpic
  end
end
