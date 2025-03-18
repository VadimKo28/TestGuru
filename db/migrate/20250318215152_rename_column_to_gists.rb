class RenameColumnToGists < ActiveRecord::Migration[6.1]
  def change
    rename_column :gists, :gist_url, :url
  end
end
