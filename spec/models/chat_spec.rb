require 'rails_helper'

RSpec.describe Chat, type: :model do
  context 'relations' do
    it { is_expected.to have_many(:messages) }
    it { is_expected.to belong_to(:application) }
  end

  context "validations" do
    subject { create(:chat) }

    it { is_expected.to validate_presence_of(:application_id) }
    it { is_expected.to validate_presence_of(:chat_number) }
    it { is_expected.to validate_uniqueness_of(:chat_number).scoped_to(:application_id) }
  end
end