class CreateAdjectives < ActiveRecord::Migration[5.1]
  def change
    create_table :adjectives do |t|
      t.string :name
    end
  end
end
