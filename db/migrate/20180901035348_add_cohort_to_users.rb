class AddCohortToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :turing_cohort, foreign_key: true
  end
end
