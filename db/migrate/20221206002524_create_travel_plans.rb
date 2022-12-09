class CreateTravelPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_plans do |t|
      t.string :name, null: false
      t.datetime :start_schedule, null: false
      t.datetime :end_schedule, null: false
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
