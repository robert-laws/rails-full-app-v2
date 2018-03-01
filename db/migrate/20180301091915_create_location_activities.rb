class CreateLocationActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :location_activities do |t|
      t.references :location, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
