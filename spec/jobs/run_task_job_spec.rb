require 'rails_helper'

RSpec.describe RunTaskJob, type: :job do
  let!(:task) { create(:task) }

  it 'sleeps task.complexity seconds' do
    expect_any_instance_of(RunTaskJob).to receive(:sleep).with(task.complexity)
    RunTaskJob.perform_now
  end
end
