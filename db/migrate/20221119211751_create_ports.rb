class CreatePorts < ActiveRecord::Migration[7.0]
  def change
    create_table :ports do |t|
      t.string :name
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.string :author
      t.references :os, null: false, foreign_key: true

      t.timestamps
    end
  end
end
