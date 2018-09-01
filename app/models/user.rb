class User < ApplicationRecord
  enum role: [:default, :admin]
  belongs_to :turing_cohort, optional: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_assignments(ids)
    ids.each do |receiver_id|
      Assignment.create(giver: self, receiver_id: receiver_id)
    end
  end
end
