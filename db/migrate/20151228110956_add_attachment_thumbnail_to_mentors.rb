class AddAttachmentThumbnailToMentors < ActiveRecord::Migration
  def self.up
    change_table :mentors do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :mentors, :thumbnail
  end
end
