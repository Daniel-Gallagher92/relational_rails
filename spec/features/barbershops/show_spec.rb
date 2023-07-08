require 'rails_helper' 

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

RSpec.describe 'the barbershops show page' do 
  it 'displays the barbershop with that id and barbershop attributes' do 
    barbershop = Barbershop.create!(name: "Blank", rank: 1, open: true)

    visit "/barbershops/:id"
    
    expect(page).to have_content(barbershop.name)
    expect(page).to have_content(barbershop.rank)
    expect(page).to have_content(barbershop.open)
  end
end