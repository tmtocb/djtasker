require 'rails_helper'

describe TasksController do 

  describe '#index' do
    
    it 'should return success http response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

  end

  describe '#show' do

    it 'should return success http response' do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:ok)
    end

  end
end