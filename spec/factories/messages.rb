FactoryBot.define do
  factory :message do
    chat_id { create(:chat, application_id: create(:application).id).id }
    message_number { Faker::Number.number(5) }

    body { Faker::Lorem.paragraph }
  end
end