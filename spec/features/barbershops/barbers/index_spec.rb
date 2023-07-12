require 'rails_helper'

RSpec.describe 'the barbershops_barbers index page' do 
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

    # User Story 5, Parent Children Index 

    # As a visitor
    # When I visit '/barbershops/:parent_id/barbers'
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


  # User Story 11, Parent Creation 

  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I  see a form for a new parent record

  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.

  it 'contains a link to /barbershops/new page' do 
    visit '/barbershops'

    
    expect(page).to have_link('New Barbershop')
  end
  
  it 'new barbershop link redirects to /barbershops/new page' do 
    visit '/barbershops'
    
    click_link('New Barbershop')
    
    expect(current_path).to eq('/barbershops/new')
  end

  it 'contains a form for a new barbershop record' do 
    visit '/barbershops/new' 

    fill_in('Name', with: 'Barber Theory')
    click_button('Create Barbershop')

    expect(current_path).to eq('/barbershops')
    expect(page).to have_content('Barber Theory')
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

  it 'displays a link to hire a new barber for that barbershop' do 
    visit "/barbershops/#{@barbershop_2.id}/barbers"

    expect(page).to have_link('Hire New Barber')
  end

  it "redirects to '/barbershops/:barbershop_id/barbers/new' where I see a form to hire a new barber" do 
    visit "/barbershops/#{@barbershop_2.id}/barbers"

    click_link('Hire New Barber')

    expect(current_path).to eq("/barbershops/#{@barbershop_2.id}/barbers/new")
  end
end