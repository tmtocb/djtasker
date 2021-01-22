class Task < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true
  validates :company, presence: true, length: { minimum: 4 }
  belongs_to :category

  scope :recent, -> { order(created_at: :desc) }
end
