class CreateResources < ActiveRecord::Migration[8.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.integer :comments_count

      t.timestamps
    end
  end
end
