json.array!(@questionnaires) do |questionnaire|
  json.extract! questionnaire, :id, :questions_concerns, :safe_relaxed, :pain_management, :ponv, :same_anaesthetic, :confident_ability, :cared_for, :anaesthetic_experience, :comments, :token
  json.url questionnaire_url(questionnaire, format: :json)
end
