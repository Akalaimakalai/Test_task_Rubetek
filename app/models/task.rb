class Task < ApplicationRecord
  validates :complexity, :priority, presence: true
  validates :complexity, numericality: { greater_than: 0 }

  default_scope { order(priority: :desc) }

  def self.first_task
    first.destroy!
  end
end
