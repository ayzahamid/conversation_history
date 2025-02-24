# frozen_string_literal: true

class Comment < ApplicationRecord
  audited

  belongs_to :author, class_name: 'User'
  belongs_to :project

  validates :content, presence: true
end
