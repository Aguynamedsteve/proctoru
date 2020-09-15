class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string  :title
      t.integer :college_id

      t.timestamps
    end
  end
end
