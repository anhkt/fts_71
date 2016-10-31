class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :duration
      t.integer :number_question

      t.timestamps
    end
  end
end
