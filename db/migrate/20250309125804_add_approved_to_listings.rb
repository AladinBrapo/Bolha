class AddApprovedToListings < ActiveRecord::Migration[8.0]
  def change
    add_column :listings, :approved, :boolean, default: false
  end
end
