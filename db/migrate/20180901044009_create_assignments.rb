class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.integer :giver_id
      t.integer :receiver_id
    end
  end
end
