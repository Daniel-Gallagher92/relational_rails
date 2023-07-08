class AddBarbershopToBarbers < ActiveRecord::Migration[7.0]
  def change
    add_reference :barbers, :barbershop, null: false, foreign_key: true
  end
end
