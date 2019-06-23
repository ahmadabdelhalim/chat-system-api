require 'rails_helper'

RSpec.describe 'Chats API', type: :request do
  let!(:application) { create(:application) }
  let!(:chats) { create_list(:chat, 20, application_id: application.id) }
  let(:application_access_token) { application.access_token }
  let(:chat_number) { chats.first.chat_number }

  describe 'GET /api/v1/applications/:application_access_token/chats' do
    before { get "/api/v1/applications/#{application_access_token}/chats", params: {}  }

    context 'when an application exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all application chats' do
        expect(json.size).to eq(20)
      end
    end

    context 'when an application does not exist' do
      let(:application_access_token) { 'whatever' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Application/)
      end
    end
  end

  describe 'GET /api/v1/applications/:application_access_token/chats/:chat_number' do
    before { get "/api/v1/applications/#{application_access_token}/chats/#{chat_number}", params: {} }

    context 'when an application chat exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the chat' do
        expect(json['chat_number']).to eq(chat_number)
      end
    end

    context 'when an application chat does not exist' do
      let(:chat_number) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Chat/)
      end
    end
  end
end