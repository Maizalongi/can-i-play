class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.float :price
      t.string :name
      t.string :description
      t.boolean :active, default: true
      t.references :category, null: false, foreign_key: true
      t.references :console, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
