require 'rails_helper'

describe 'Task API', type: :request do

  describe 'POST /api/v1/tasks' do

    describe 'user creates task' do
      context 'with valid params' do

        it 'saves the task into DB' do
          expect { post "/api/v1/tasks", params: { task: attributes_for(:task) } }.to change(Task, :count).by(1)
        end

        it 'calls RunTaskJob' do
          expect(RunTaskJob).to receive(:perform_later)
          post "/api/v1/tasks", params: { task: attributes_for(:task) }
        end

        it 'returns 200 status' do
          post "/api/v1/tasks", params: { task: attributes_for(:task) }
          expect(response).to be_successful
        end
      end

      context 'with invalid params' do
        it ' does not save the task into DB' do
          expect { post "/api/v1/tasks", params: { task: attributes_for(:task, :invalid) } }.to_not change(Task, :count)
        end

        it 'returns 400 status' do
          post "/api/v1/tasks", params: { task: attributes_for(:task, :invalid) }
          expect(response.status).to eq 400
        end
      end
    end
  end
end
