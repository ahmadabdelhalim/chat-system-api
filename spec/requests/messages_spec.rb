require 'rails_helper'

RSpec.describe 'Messages API', type: :request do
  let!(:application) { create(:application) }
  let!(:chats) { create_list(:chat, 20, application_id: application.id) }
  let!(:messages) { create_list(:message, 20, chat_id: chats.first.id) }
  let(:application_access_token) { application.access_token }
  let(:chat_number) { chats.first.chat_number }
  let(:message_number) { messages.first.message_number }

  describe 'GET /api/v1/applications/:application_access_token/chats/:chat_number/messages' do
    before { get "/api/v1/applications/#{application_access_token}/chats/#{chat_number}/messages", params: {}  }

    context 'when a chat exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all chat messages' do
        expect(json.size).to eq(20)
      end
    end

    context 'when a chat does not exist' do
      let(:chat_number) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Chat/)
      end
    end
  end

  describe 'GET /api/v1/applications/:application_access_token/chats/:chat_number/messages/:message_number' do
    before { get "/api/v1/applications/#{application_access_token}/chats/#{chat_number}/messages/#{message_number}", params: {} }

    context 'when a chat message exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the message' do
        expect(json['message_number']).to eq(message_number)
      end
    end

    context 'when a chat message does not exist' do
      let(:message_number) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Message/)
      end
    end
  end

  describe 'PUT /api/v1/applications/:application_access_token/chats/:chat_number/messages/:message_number' do
    let(:valid_attributes) { 
       { "message": { "body": 'South Park' } }
    }

    context 'when the record exists' do
      before { put "/api/v1/applications/#{application_access_token}/chats/#{chat_number}/messages/#{message_number}", params: valid_attributes }

      it 'updates the record' do
        expect(json).not_to be_empty
        expect(json["body"]).to eq('South Park')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end