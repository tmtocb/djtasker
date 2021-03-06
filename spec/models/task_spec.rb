require 'rails_helper'

RSpec.describe Task, type: :model do

  describe '#validations' do

    it 'should have valid factory' do
      task = build :task
      expect(task).to be_valid
    end

    it 'should validate presence of attributes' do
      task = build :task, title: nil, description: nil, company: nil
      expect(task).not_to be_valid
      expect(task.errors.messages[:title]).to include("can't be blank")
      expect(task.errors.messages[:description]).to include("can't be blank")
      expect(task.errors.messages[:company]).to include("can't be blank")
    end

    it 'should validate minimum length of title and company' do
      invalid_task = build :task, title: '1234', company: '123'
      expect(invalid_task).not_to be_valid
      valid_task = build :task, title: '12345', company: '1234'
      expect(valid_task).to be_valid
    end
  end

  describe '.recent' do
    it 'should list tasks in descending order' do
      old_task = create :task, title: 'oldtask', description: 'oldtask', company: 'oldtask'
      new_task = create :task, title: 'newtask', description: 'newtask', company: 'newtask'
      expect(described_class.recent).to eq(
      [ new_task, old_task ])
      old_task.update_column :created_at, Time.now
      expect(described_class.recent).to eq(
      [old_task, new_task ])
    end
  end

  describe '#associations' do
    it { is_expected.to belong_to(:category) }
  end
end
