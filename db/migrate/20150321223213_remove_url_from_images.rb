class RemoveUrlFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :url, :string
  end
end
