class CreateMasterCareerAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :master_career_areas do |t|
      t.references :master_career, index: true, foreign_key: true
      t.references :area, index: true, foreign_key: true
      t.integer :level
      t.timestamps
    end
  end
end
