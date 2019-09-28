class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :parts_name
      t.references :bike, foreign_key: true

      t.timestamps
    end
  end
end
