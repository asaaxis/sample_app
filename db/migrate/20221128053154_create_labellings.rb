class CreateLabellings < ActiveRecord::Migration[6.1]
  def change
    create_table :labellings do |t|
      t.references :blog, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
