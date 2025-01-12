class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.boolean :correct, default: false
      t.belongs_to :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
