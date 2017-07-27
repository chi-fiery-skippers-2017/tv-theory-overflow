class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content, null: false
      t.integer :author_id, null: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
