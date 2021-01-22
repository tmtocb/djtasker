require 'rails_helper'

RSpec.describe "Tasks", type: :feature do

  

  describe '#delete' do
    it 'should delete task' do
      task = Task.create!(title: 'testtask', description: 'testtask', company: 'testtask', category_id: 1)
      visit root_path
      expect(page).to have_content('testtask')
      click_on 'testtask'
      click_on 'Delete'
      visit root_path
      expect(page).not_to have_content('testtask')
    end
  end
end