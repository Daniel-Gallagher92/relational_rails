class CreateBarbers < ActiveRecord::Migration[7.0]
  def change
    create_table :barbers do |t|
      t.string :name
      t.integer :barbershop_id
      t.integer :clients
      t.boolean :available

      t.timestamps
    end
  end
end
