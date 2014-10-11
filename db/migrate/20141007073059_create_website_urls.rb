class CreateWebsiteUrls < ActiveRecord::Migration
  def change
    create_table :website_urls do |t|
      t.string :name

      t.timestamps
    end
  end
end
