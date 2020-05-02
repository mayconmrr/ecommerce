# frozen_string_literal: true

class AddAttachmentPictureToAds < ActiveRecord::Migration[6.0]
  def self.up
    change_table :ads do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :ads, :picture
  end
end
