class CreateConsoles < ActiveRecord::Migration[7.0]
  def change
    create_table :consoles do |t|
      t.string :console

      t.timestamps
    end
  end
end
