require 'rails_helper'

RSpec.describe "Tasks", type: :system do

  describe '#index' do
    it 'should display newly created task on root' do
      visit new_task_path
      fill_in 'Task Title', with: 'Test Task'
      fill_in 'Task Description', with: 'Test Description'
      fill_in 'Your company', with: 'Test Description'
      click_on 'Create Task'
      visit root_path
      expect(page).to have_content('Test Task')
    end
  end


  describe '#create' do
    it 'should create valid task' do
      visit new_task_path
      fill_in 'Task Title', with: 'Test Task'
      fill_in 'Task Description', with: 'Test Description'
      fill_in 'Your company', with: 'Test Description'
      click_on 'Create Task'
      expect(page).to have_content('Test Task')
    end

    it 'should not create invalid task' do
      visit new_task_path
      fill_in 'Task Title', with: ''
      fill_in 'Task Description', with: ''
      fill_in 'Your company', with: 'Test Description'
      click_on 'Create Task'
      expect(page).to have_content('Please review the problems below:')
    end
  end
end
