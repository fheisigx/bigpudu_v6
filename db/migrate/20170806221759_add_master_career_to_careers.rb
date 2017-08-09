class AddMasterCareerToCareers < ActiveRecord::Migration[5.1]
  def change
    add_reference :careers, :master_career, foreign_key: true, index: true
  end
end
