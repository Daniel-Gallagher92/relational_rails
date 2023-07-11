require 'rails_helper'

RSpec.describe 'Barbershop Edit' do 
  # User Story 12, Parent Update 

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"

# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:

# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

  it 'has a link to the edit page' do 
    barbershop = Barbershop.create!(name: 'Barber Theory')

    visit "/barbershops/#{barbershop.id}"

    expect(page).to have_link('Update Barbershop')
  end

  it 'redirects to the edit page w/ form' do 
    barbershop = Barbershop.create!(name: 'Barber Theory')

    visit "/barbershops/#{barbershop.id}"

    click_link("Update Barbershop")

    expect(current_path).to eq("/barbershops/#{barbershop.id}/edit")
    
    fill_in('Name', with: 'Barber Theory')
  end

  it 'redirects to the show page w/ updated info' do 
    barbershop = Barbershop.create!(name: 'Brbr Theory')

    visit "/barbershops/#{barbershop.id}"

    expect(page).to have_content('Brbr Theory')

    visit "/barbershops/#{barbershop.id}/edit"

    fill_in('Name', with: 'Barber Theory')

    click_button("Update Barbershop")

    expect(current_path).to eq("/barbershops/#{barbershop.id}")
    expect(page).to have_content('Barber Theory')
  end
end