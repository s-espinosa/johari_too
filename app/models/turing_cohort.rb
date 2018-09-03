class TuringCohort < ApplicationRecord
  validates :name, uniqueness: true
end
