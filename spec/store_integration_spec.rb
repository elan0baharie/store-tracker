require('spec_helper')

describe('Store', {:type => :feature}) do
  it("will create a new store obj and view it") do
    visit('/')
    click_on('Add a store')
    fill_in('name', :with => "Mom's Shop")
    fill_in('address', :with => "234 Real Street, Seattle, WA, 98116")
    click_button("Submit")
    click_on("View all stores")
    expect(page).to have_content("Mom's Shop")
  end

  it("will delete a store after it is created") do
    new_store = Store.create({:name => "Moms", :address => "234 Real Street, Seattle, WA, 98116"})
    visit('/')
    click_on("View all stores")
    click_on("Moms")
    click_on("Moms,")
    click_button("Delete")
    click_on("View all stores")
    expect(page).to have_content("No stores yet")
  end

  it("will edit the information for a given store") do
    new_store = Store.create({:name => "Moms", :address => "234 Real Street, Seattle, WA, 98116"})
    visit('/')
    click_on("View all stores")
    click_on("Moms")
    click_on("Moms,")
    fill_in('name', :with => "Dads")
    fill_in('address', :with => "234 Real Street, Seattle, WA, 98116")
    click_button("Submit")
    click_on("View all stores")
    expect(page).to have_content("Dads")
  end
end
