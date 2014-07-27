class RemoveAnswersReadFromQuestionnaires < ActiveRecord::Migration
  def change
    remove_column :questionnaires, :answers_read, :datetime
    add_column :questionnaires, :answers_read, :boolean
  end
end
