require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#validations' do
    it 'should have valid factory' do
      task = build :task
      expect(task).to be_valid
    end
  end
end
