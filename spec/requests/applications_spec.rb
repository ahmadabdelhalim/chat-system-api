require 'rails_helper'

RSpec.describe 'Applications API', type: :request do
  let!(:applications) { create_list(:application, 10) }
  let(:application) { applications.first.access_token }

  describe 'GET /api/v1/applications' do
    before { get '/api/v1/applications'  }

    it 'returns applications' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/applications/:access_token' do
    before { get "/api/v1/applications/#{application}" }

    context 'when the record exists' do
      it 'returns the application' do
        expect(json).not_to be_empty
        expect(json["access_token"]).to eq(application)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:application) { 'whatever' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Application/)
      end
    end
  end

  describe 'PUT /api/v1/applications/:access_token' do
    let(:valid_attributes) { 
       { "application": { "name": 'Instabug' } }
    }

    context 'when the record exists' do
      before { put "/api/v1/applications/#{application}", params: valid_attributes }

      it 'updates the record' do
        expect(json).not_to be_empty
        expect(json["access_token"]).to eq(application)
        expect(json["name"]).to eq('Instabug')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end