require 'rails_helper'

RSpec.describe "Tasks", type: :feature do

  describe '#update' do
    it 'should Edit valid task' do
      task = Task.create!(title: 'testtask', description: 'testtask', company: 'testtask')
      visit edit_task_path(id: task.id)
      fill_in 'Title', with: 'new test task'
      click_on 'Update Task'
      visit tasks_path
      expect(page).to have_content('new test task')
    end

    it 'should not Edit invalid task' do
      task = Task.create!(title: 'testtask', description: 'testtask', company: 'testtask')
      visit edit_task_path(id: task.id)
      fill_in 'Title', with: ''
      click_on 'Update Task'
      expect(page).to have_content('Please review the problems below:')
    end
  end
end