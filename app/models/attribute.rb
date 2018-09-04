class Attribute < ApplicationRecord
  belongs_to :assignment
  belongs_to :adjective

  def self.create_multiple(assignment, adjectives)
    adjectives.each do |id, checked|
      if checked == "1"
        Attribute.create(assignment: assignment,
                         adjective: Adjective.find(id))
      end
    end
  end
end
