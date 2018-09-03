class CreateTuringCohort < ActiveRecord::Migration[5.1]
  def change
    create_table :turing_cohorts do |t|
      t.string :name
    end
  end
end
