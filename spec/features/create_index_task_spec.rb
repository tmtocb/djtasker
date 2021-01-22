require 'rails_helper'

RSpec.describe "Tasks", type: :feature do

  describe '#create' do
    it 'should create valid task' do
      visit new_task_path
      expect(page).to have_content('New Task')
      fill_in 'Task Title', with: 'Test Task'
      fill_in 'Task Description', with: 'Test Description'
      fill_in 'Your company', with: 'Test Description'
      click_on 'Create Task'
      expect(page).to have_content('Test Description')
    end

    it 'should not create invalid task' do
      visit new_task_path
      expect(page).to have_content('New Task')
      fill_in 'Task Title', with: ''
      fill_in 'Task Description', with: ''
      fill_in 'Your company', with: 'Test Description'
      click_on 'Create Task'
      expect(page).to have_content('Please review the problems below:')
    end
  end
end
