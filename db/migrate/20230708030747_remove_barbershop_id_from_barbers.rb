class RemoveBarbershopIdFromBarbers < ActiveRecord::Migration[7.0]
  def change
    remove_column :barbers, :barbershop_id, :integer
  end
end
