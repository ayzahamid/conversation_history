# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :comments, dependent: :destroy

  belongs_to :creator, class_name: 'User'

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  enum status: { pending: 0, in_progress: 1, complete: 2 }
end
