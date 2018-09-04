class Assignment < ApplicationRecord
  belongs_to :giver,    foreign_key: "giver_id",    class_name: "User"
  has_many :johari_attributes, foreign_key: "assignment_id", class_name: "Attribute"

  def self.create_multiple(checkboxes)
    ids = []
    checkboxes.each do |id, checked|
      ids << id if checked == "1"
    end

    User.find(ids).each do |user|
      user.create_assignments(ids - [user.id.to_s])
    end
  end

  def receiver
    census_user = CensusService.find_user(receiver_id)
    CensusUser.new(census_user)
  end

  def census_giver
    census_user = CensusService.find_user(giver_id)
    CensusUser.new(census_user)
  end

  def summary
    "#{census_giver.full_name} owes feedback to #{receiver.full_name}"
  end
end
