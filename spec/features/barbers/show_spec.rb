require 'rails_helper'

  # User Story 4, Child Show 

# As a visitor
# When I visit '/barber/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)
describe 'Barber show page' do 
  it 'can display barber by id as well as that barbers attributes' do 
  barbershop = Barbershop.create!(name: "Blank", rank: 1, open: true)
  # require 'pry'; binding.pry
  barber = barbershop.barbers.create!(name: "Sasha", clients: 14, available: false)

  visit "/barber/#{barber.id}"
    # save_and_open_page
  expect(page).to have_content(barber.name)
  expect(page).to have_content(barber.clients)
  expect(page).to have_content(barber.available)
  end
  # Barber.all.each do |barber|
  #   expect(page).to have_content(barber.name)
  #   expect(page).to have_content(barber.barbershop_id)
  #   expect(page).to have_content(barber.clients)
  #   expect(page).to have_content(barber.available)
  # end
  # end
end