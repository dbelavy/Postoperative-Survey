class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :questions_concerns
      t.string :safe_relaxed
      t.string :pain_management
      t.string :ponv
      t.string :same_anaesthetic
      t.string :confident_ability
      t.string :cared_for
      t.string :anaesthetic_experience
      t.string :comments
      t.string :token

      t.timestamps
    end
  end
end
