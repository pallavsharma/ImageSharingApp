class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :tag_line
      t.timestamps null: false
      t.belongs_to :album, index: true
    end
  end
end
