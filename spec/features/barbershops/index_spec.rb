require 'rails_helper' 

# User Story 1, Barbershop Index 

# For each Barbershop table
# As a visitor
# When I visit '/barbershops'
# Then I see the name of each Barbershop record in the system

RSpec.describe 'the barbershops index page' do 
  it 'displays the name of each Barbershop record in the system' do 
    barbershop = Barbershop.create!(name: "Blank")

    visit "/barbershops"

    expect(page).to have_content(barbershop.name)
  end
end