class AddDatesentToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :datesent, :datetime
    add_column :patients, :dateremindersent, :datetime
    add_column :patients, :bounce_details, :string
  end
end
