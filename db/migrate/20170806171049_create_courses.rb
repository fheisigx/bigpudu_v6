class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :code_name
      t.string :name
      t.references :institution, index: true, foreign_key: true
      t.references :area, index: true, foreign_key: true
      t.timestamps
    end
  end
end
