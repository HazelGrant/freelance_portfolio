class AddDescriptioNToImages < ActiveRecord::Migration
  def change
    add_column :images, :description, :text
  end
end
