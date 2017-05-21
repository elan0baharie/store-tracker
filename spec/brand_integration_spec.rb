require('spec_helper')

describe('Brand', {:type => :feature}) do
  it("will create a new brand obj") do
    visit('/')
    click_on("Add a brand")
    fill_in("name", :with => "Shoestyling")
    fill_in("style", :with => "Runningman Sandalis")
    fill_in("price", :with => 25)
    click_button("Submit")
    click_on("View all brands")
    expect(page).to have_content("Shoestyling")
  end

  it("will test validation and land on an error page") do
    new_brand = Brand.create({:name => "Badathlete", :style => "Go Slows", :price => 55})
    visit('/')
    click_on("Add a brand")
    fill_in("name", :with => "badathlete")
    fill_in("style", :with => "Sleeks")
    fill_in("price", :with => 55)
    click_button("Submit")
    expect(page).to have_content("Error")
  end

  it("will view the brands associated with a desired store.") do
    new_brand = Brand.create({:name => "Badathlete", :style => "Go Slows", :price => 55})
    new_store = Store.create({:name => "Mom's Shop", :address => "123 Fake St."})
    new_store.brands.push(new_brand)
    visit('/')
    click_on("View all stores")
    click_on("Mom's Shop")
    expect(page).to have_content("Badathlete")
  end
end
