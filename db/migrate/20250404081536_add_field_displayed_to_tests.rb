class AddFieldDisplayedToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :displayed, :boolean, default: false
  end
end
