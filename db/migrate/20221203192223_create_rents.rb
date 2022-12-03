class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.date :start_date
      t.date :end_date
      t.float :price
      t.boolean :status
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
