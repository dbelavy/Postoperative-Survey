class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :procedure
      t.string :survey
      t.date :senddate
      t.string :token

      t.timestamps
    end
  end
end
