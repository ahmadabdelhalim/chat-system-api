FactoryBot.define do
  factory :chat do
    application_id { create(:application).id }
    chat_number { Faker::Number.number(5) }
  end
end