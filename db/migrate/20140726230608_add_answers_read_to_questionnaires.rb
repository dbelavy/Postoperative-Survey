class AddAnswersReadToQuestionnaires < ActiveRecord::Migration
  def change
    add_column :questionnaires, :answers_read, :datetime
  end
end
