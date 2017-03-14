class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.belongs_to :user, index: true
      t.belongs_to :image, index: true
      t.timestamps
    end
  end
end
