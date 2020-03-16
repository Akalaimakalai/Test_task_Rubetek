require 'rails_helper'

feature 'User can see stats', %q{
  Some description
} do

  scenario 'User visit /stats' do
    visit stats_path
    expect(page).to have_content("processed: #{Sidekiq::Stats.new.processed}")
    expect(page).to have_content("enqueued: #{Sidekiq::Stats.new.enqueued}")
  end
end
