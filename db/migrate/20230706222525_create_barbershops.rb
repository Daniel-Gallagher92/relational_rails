class CreateBarbershops < ActiveRecord::Migration[7.0]
  def change
    create_table :barbershops do |t|
      t.string :name
      t.integer :rank
      t.boolean :open

      t.timestamps
    end
  end
end
