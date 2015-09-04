class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :slug, :uniqe => true
      t.string :twitter_url
      t.string :twitter_bio
      t.timestamps null: false
    end
  end
end
