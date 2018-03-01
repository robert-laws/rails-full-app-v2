class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :ideal_type
      t.string :ideal_size
      t.string :energy_usage

      t.timestamps
    end
  end
end
