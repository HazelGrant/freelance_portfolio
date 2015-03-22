class AddDefaultToImages < ActiveRecord::Migration
  def change
    add_column :images, :default, :boolean, default: false
  end
end
