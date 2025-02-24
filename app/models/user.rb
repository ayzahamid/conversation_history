# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :secure_validatable, email_validation: false

  before_validation :strip_whitespaces

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false

  private

  def strip_whitespaces
    self.first_name = first_name.presence
    self.last_name = last_name.presence
  end
end
