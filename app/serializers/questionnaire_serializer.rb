class QuestionnaireSerializer < ActiveModel::Serializer
  attributes :id, :questions_concerns, :safe_relaxed, :pain_management, :ponv, :same_anaesthetic, :confident_ability, :cared_for, :anaesthetic_experience, :comments, :token
end
