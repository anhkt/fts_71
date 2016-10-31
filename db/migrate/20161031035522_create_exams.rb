class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :time_start
      t.integer :time_end
      t.string :status
      t.integer :score
      t.references :user, foreign_key: true
      t.references :subject

      t.timestamps
    end
  end
end
