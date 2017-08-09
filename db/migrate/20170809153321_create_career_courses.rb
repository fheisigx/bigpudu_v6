class CreateCareerCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :career_courses do |t|
      t.references :career, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.integer :semester
      t.timestamps
    end
  end
end
