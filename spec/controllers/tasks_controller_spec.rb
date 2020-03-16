require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Task to @task' do
      expect(assigns(:task)).to be_a_new(Task)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    context 'with valid attributes' do

      it 'saves the task into DB' do
        expect { post :create, params: { task: attributes_for(:task) } }.to change(Task, :count).by(1)
      end

      it 'calls RunTaskJob' do
        expect(RunTaskJob).to receive(:perform_later)
        post :create, params: { task: attributes_for(:task) }
      end

      it 'redirects to root' do
        post :create, params: { task: attributes_for(:task) }
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the task' do
        expect { post :create, params: { task: attributes_for(:task, :invalid) } }.to_not change(Task, :count)
      end

      it 'renders template new' do
        post :create, params: { task: attributes_for(:task, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
