class Course < ApplicationRecord
  validates :title, presence: true
end
