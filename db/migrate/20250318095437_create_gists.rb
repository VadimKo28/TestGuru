class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :question, null: false, foreign_key: true
      t.string :gist_url

      t.timestamps
    end
  end
end
