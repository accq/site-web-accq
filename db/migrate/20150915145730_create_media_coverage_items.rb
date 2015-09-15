class CreateMediaCoverageItems < ActiveRecord::Migration
  def change
    create_table :media_coverage_items do |t|
      t.string :title
      t.string :url
      t.string :source
      t.string :archived_url #sauvegarder les liens sur archive.org
      t.string :summary
      t.string :preview_image
      t.string :media_type #accepted values: text, video,  audio
      t.date :published_on
    end
  end
end
