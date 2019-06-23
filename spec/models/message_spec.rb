require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'relations' do
    it { is_expected.to belong_to(:chat) }
  end

  context "validations" do
    subject { create(:message) }

    it { is_expected.to validate_presence_of(:chat_id) }
    it { is_expected.to validate_presence_of(:message_number) }
    it { is_expected.to validate_presence_of(:body) }

    it { is_expected.to validate_uniqueness_of(:message_number).scoped_to(:chat_id) }
  end
end

# test searchkick
describe Message, search: true do
  it "searches" do
    chat = create(:chat)
    Message.create!(body: "Apple", chat_id: chat.id)
    Message.search_index.refresh
    assert_equal ["Apple"], Message.search("apple").map(&:body)
  end
end