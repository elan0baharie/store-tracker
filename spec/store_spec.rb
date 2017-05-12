require('spec_helper')

describe(Store) do
  it("validates presence of a description") do
    new_store = Store.new({:name => ""})
    expect(new_store.save()).to(eq(false))
  end

  it("validates uniqueness of a description") do
    new_store = Store.new({:name => "Northgate Mall"})
    new_store.save()
    new_store2 = Store.new({:name => "Northgate Mall"})
    expect(new_store2.save()).to(eq(false))
  end
end
