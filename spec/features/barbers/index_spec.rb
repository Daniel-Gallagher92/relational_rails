require 'rails_helper'

# User Story 3, Child Index 

# As a visitor
# When I visit '/barber'
# Then I see each barber in the system including the barber's attributes
# (data from each column that is on the child table)

RSpec.describe 'Barber index page' do 
  it 'displays each barber with attributes' do 
    barbershop = Barbershop.create!(name: "Blank", rank: 1, open: true)

    barber_1 = Barber.create!(name: "Sasha", clients: 14, available: false)
    barber_2 = Barber.create!(name: "Kylee", clients: 14, available: false)
    barber_3 = Barber.create!(name: "Holden", clients: 5, available: true)
    
    visit "/barbers" 

    Barber.all.each do |barber|
      expect(page).to have_content(barber.name)
      expect(page).to have_content(barber.barbershop_id)
      expect(page).to have_content(barber.clients)
      expect(page).to have_content(barber.available)
    end
  end

#   User Story 8, Child Index Link

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index

  it 'displays a link to the barber index page' do
    barbershop = Barbershop.create!(name: "Blank", rank: 1, open: true)

    visit "/barbershops"

    expect(page).to have_link("Barbers")
  end

end


