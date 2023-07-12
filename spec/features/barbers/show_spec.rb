require 'rails_helper'

  # User Story 4, Child Show 

# As a visitor
# When I visit '/barber/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)
RSpec.describe 'Barber show page' do 

  before :each do 

  @barbershop = Barbershop.create!(name: "Blank", rank: 1, open: true)
  @barber = @barbershop.barbers.create!(name: "Ssha", clients: 14, available: false)
  end
  it 'can display barber by id as well as that barbers attributes' do 

  visit "/barbers/#{@barber.id}"

  expect(page).to have_content(@barber.name)
  expect(page).to have_content(@barber.clients)
  expect(page).to have_content(@barber.available)
  end

  #   User Story 8, Child Index Link

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index

  it 'can display a link to the barbers index page' do 

  visit "/barbers/#{@barber.id}" 

  expect(page).to have_link("Barbers")
  end


  # User Story 14, Child Update 

  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"

  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information

  it 'can display a link to update the barber' do 

    visit "/barbers/#{@barber.id}"

    expect(page).to have_link("Update Barber")
  end

  it 'can edit the barber' do 

    visit "/barbers/#{@barber.id}"
    
    click_link "Update Barber" 

    expect(current_path).to eq("/barbers/#{@barber.id}/edit")

    fill_in 'Name', with: "Sasha"
    click_button "Update Barber"

    expect(current_path).to eq("/barbers/#{@barber.id}")
    expect(page).to have_content("Sasha")
  end
end