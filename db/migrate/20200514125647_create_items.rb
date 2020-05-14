class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image_id
      t.boolean :status, default: true
      t.integer :price

      t.timestamps
    end
  end
end
