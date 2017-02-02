# This migration comes from refinery_meetings (originally 1)
class CreateMeetingsMeetings < ActiveRecord::Migration

  def up
    create_table :refinery_meetings do |t|
      t.string :meeting_title
      t.datetime :date
      t.string :location
      t.text :agenda
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-meetings"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/meetings/meetings"})
    end

    drop_table :refinery_meetings

  end

end
