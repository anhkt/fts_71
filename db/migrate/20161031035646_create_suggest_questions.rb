class CreateSuggestQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggest_questions do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
