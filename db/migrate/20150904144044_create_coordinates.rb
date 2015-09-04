class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.decimal :lat
      t.decimal :lon
      t.references :locatable, polymorphic: true
      t.timestamps null: false
    end
  end
end
