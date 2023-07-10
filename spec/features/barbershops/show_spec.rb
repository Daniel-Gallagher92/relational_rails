require 'rails_helper' 

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

RSpec.describe 'the barbershops show page' do 
  it 'displays the barbershop with that id and barbershop attributes' do 
    barbershop = Barbershop.create!(name: "Blank", rank: 1, open: true)

    visit "/barbershops/#{barbershop.id}"
    
    expect(page).to have_content(barbershop.name)
    expect(page).to have_content(barbershop.rank)
    expect(page).to have_content(barbershop.open)
  end


# User Story 7, Parent Child Count

# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

  it 'displays the number of children associated with this parent' do
    barbershop = Barbershop.create!(name: "Blank", rank: 1, open: true)
    barbershop_2 = Barbershop.create!(name: "Blank Platt Park")
    barber_1 = barbershop.barbers.create!(name: "Sasha", barbershop_id: 1, clients: 14, available: false)
    barber_2 = barbershop.barbers.create!(name: "Kylee", barbershop_id: 1, clients: 14, available: false)
    barber_3 = barbershop.barbers.create!(name: "Holden", barbershop_id: 1, clients: 5, available: true)

    visit "/barbershops/#{barbershop.id}"

    expect(page).to have_content("Number of Barbers: #{barbershop.barbers.count}") 
  end
end