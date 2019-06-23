require 'rails_helper'

RSpec.describe Application, type: :model do
  context 'relations' do
    it { is_expected.to have_many(:chats) }
  end

  context 'validations' do
    subject { Application.new(name: 'Instabug') }
    it { is_expected.to validate_uniqueness_of(:access_token) }
    it { is_expected.to validate_presence_of(:name) }
  end
end