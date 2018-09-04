class Adjective < ApplicationRecord
  has_many :johari_attributes, foreign_key: "adjective_id", class_name: "Attribute"
  has_many :assignments, through: :johari_attributes
end
