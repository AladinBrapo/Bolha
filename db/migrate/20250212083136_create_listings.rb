class CreateListings < ActiveRecord::Migration[8.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :category_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
