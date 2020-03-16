require 'rails_helper'

RSpec.describe StatsController, type: :controller do

  describe 'GET #index' do

    it 'calls statistic from sidekiq' do
      expect(Sidekiq::Stats).to receive(:new)
      get :index
    end

    it 'renders template index' do
      get :index
      expect(response).to render_template :index
    end
  end
end
