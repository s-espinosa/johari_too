class Assignment < ApplicationRecord
  belongs_to :giver, foreign_key: "giver_id", class_name: "User"
  belongs_to :receiver, foreign_key: "receiver_id", class_name: "User"

  def self.create_multiple(checkboxes)
    ids = []
    checkboxes.each do |id, checked|
      ids << id if checked == "1"
    end

    User.find(ids).each do |user|
      user.create_assignments(ids - [user.id.to_s])
    end
  end
end
