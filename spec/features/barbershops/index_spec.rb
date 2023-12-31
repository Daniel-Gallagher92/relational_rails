require 'rails_helper' 

# User Story 1, Barbershop Index 

# For each Barbershop table
# As a visitor
# When I visit '/barbershops'
# Then I see the name of each Barbershop record in the system

RSpec.describe 'the barbershops index page' do 
  before :each do 
    @barbershop = Barbershop.create!(name: "Blank Cherry Creek")
    @barbershop_2 = Barbershop.create!(name: "Blank Platt Park")

    @barber_1 = @barbershop.barbers.create!(name: "Sasha", clients: 14, available: false)
    @barber_2 = @barbershop.barbers.create!(name: "Kylee", clients: 14, available: false)
    @barber_3 = @barbershop.barbers.create!(name: "Holden", clients: 5, available: true)
    @barber_4 = @barbershop_2.barbers.create!(name: "Carlos", clients: 14, available: false)
    @barber_5 = @barbershop_2.barbers.create!(name: "Quincy", clients: 14, available: false)
    @barber_6 = @barbershop_2.barbers.create!(name: "Ali", clients: 14, available: false)

  end
  
  it 'displays the name of each Barbershop record in the system' do 
    @barbershop = Barbershop.create!(name: "Blank Cherry Creek")

    visit "/barbershops"

    expect(page).to have_content(@barbershop.name)
  end
  # 
  #   User Story 6, Parent Index sorted by Most Recently Created 

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created

  it 'displays barbers by most recently created first, and when the records were created' do 
    visit "/barbershops"
  
    expect(@barbershop_2.name).to appear_before(@barbershop.name)
  end

  #   User Story 9, Parent Index Link

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index

  it 'displays a link to the barbershop index page' do 

    visit "/barbers"

    expect(page).to have_link("Barbershops")
  end

  #   User Story 10, Parent Child Index Link

  # As a visitor
  # When I visit a parent show page ('/parents/:id')
  # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

  it 'displays a link to the barbers index page' do

    visit "/barbershops/#{@barbershop.id}"

    expect(page).to have_link("Barbers")
  end
end