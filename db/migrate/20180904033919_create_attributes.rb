class CreateAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :attributes do |t|
      t.references :assignment, foreign_key: true
      t.references :adjective, foreign_key: true
    end
  end
end
