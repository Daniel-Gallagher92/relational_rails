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

#   User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)
# Is this just the button on the barbershops page to the barbers index?
  describe 'When I visit \'/barbershops/:barbershop_id/barbers\'' do
    it 'displays all barbers related to barbershop_id' do 

      visit "/barbershops/#{@barbershop.id}/barbers"
    

        expect(page).to have_content(@barber_1.name)
        expect(page).to have_content(@barber_1.clients)
        expect(page).to have_content(@barber_1.available)

        expect(page).to have_content(@barber_2.name)
        expect(page).to have_content(@barber_2.clients)
        expect(page).to have_content(@barber_2.available)

    end
  end

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
  
# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"

# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new barber for hire
# When I fill in the form with the child's attributes:

# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

  it 'displays a link to create a new barber' do 
    visit "/barbershops/#{@barbershop_2.id}/barbers"

    click_link("Hire New Barber")

    expect(current_path).to eq("/barbershops/#{Barbershop.last.id}/barbers/new")
  end
end