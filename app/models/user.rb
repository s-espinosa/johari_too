class User < ApplicationRecord
  enum role: [:default, :admin]

  def create_assignments(ids)
    ids.each do |receiver_id|
      Assignment.create(giver: self, receiver_id: receiver_id)
    end
  end
end
