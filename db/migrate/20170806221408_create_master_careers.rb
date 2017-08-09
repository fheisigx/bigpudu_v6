class CreateMasterCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :master_careers do |t|
      t.string :name
      t.timestamps
    end
  end
end
