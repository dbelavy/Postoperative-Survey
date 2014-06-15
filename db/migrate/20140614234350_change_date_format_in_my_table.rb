class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :patients, :senddate, :datetime
  end
end
