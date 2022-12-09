class CreateAssigns < ActiveRecord::Migration[6.1]
  def change
    create_table :assigns do |t|
      t.references :user, foreign_key: true, null: false
      t.references :team, foreign_key: true, null: false

      t.timestamps
    end
  end
end
