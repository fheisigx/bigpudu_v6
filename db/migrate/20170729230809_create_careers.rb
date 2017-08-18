class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
      t.references :institution, index: true, foreign_key: true      
      t.timestamps
    end
  end
end
