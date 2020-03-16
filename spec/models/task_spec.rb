require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of :complexity }
  it { should validate_presence_of :priority }
  it { should validate_numericality_of(:complexity).is_greater_than(0) }

  describe 'method testing' do
    let!(:task1) { create(:task, priority: 5) }
    let!(:task2) { create(:task, priority: 10) }
    let!(:task3) { create(:task, priority: 1) }

    describe "default_scope" do
      it 'orders tasks by priority' do
        expect(Task.all).to eq [ task2, task1, task3 ]
      end
    end

    describe ".first_task" do
      it 'returns task with highest priority' do
        expect(Task.first_task).to eq task2
      end

      it 'destroys the task' do
        Task.first_task
        expect(Task.all).to eq [ task1, task3 ]
      end
    end
  end
end
