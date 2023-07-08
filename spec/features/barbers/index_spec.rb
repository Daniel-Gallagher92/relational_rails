require 'rails_helper'

# User Story 3, Child Index 

# As a visitor
# When I visit '/barber'
# Then I see each barber in the system including the barber's attributes
# (data from each column that is on the child table)

RSpec.describe 'Barber index page' do 
  it 'displays each barber with attributes' do 
    barber_1 = Barber.create(name: "Sasha", barbershop_id: 1, clients: 14, available: false)
    barber_2 = Barber.create(name: "Kylee", barbershop_id: 1, clients: 14, available: false)
    barber_3 = Barber.create(name: "Holden", barbershop_id: 1, clients: 5, available: true)
    
    visit "/barbers" 

    # expect(page).to have_content(barber_1.name)
    # expect(page).to have_content(barber_2.barbershop_id)
    # expect(page).to have_content(barber_3.clients)
    # expect(page).to have_content(barber_3.available)

    Barber.all.each do |barber|
      expect(page).to have_content(barber.name)
      expect(page).to have_content(barber.barbershop_id)
      expect(page).to have_content(barber.clients)
      expect(page).to have_content(barber.available)
    end
  end
end


