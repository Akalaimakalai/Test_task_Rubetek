require 'rails_helper'

feature 'User can create task', %q{
  Some description
} do

  describe 'User creates task' do
    background { visit root_path }

    scenario 'with valid params' do
      fill_in 'Complexity', with: 1
      fill_in 'Priority', with: 1

      click_on 'Create Task'

      expect(page).to have_content('Your task created successfully')
    end

    scenario 'with invalid params' do
      fill_in 'Complexity', with: nil
      fill_in 'Priority', with: nil

      click_on 'Create Task'

      expect(page).to have_content("Complexity can't be blank")
      expect(page).to have_content("Complexity is not a number")
      expect(page).to have_content("Priority can't be blank")
    end
  end
end
