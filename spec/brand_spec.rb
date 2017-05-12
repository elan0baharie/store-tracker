require('spec_helper')

describe(Brand) do
  it("validates presence of a description") do
    new_brand = Brand.new({:name => ""})
    expect(new_brand.save()).to(eq(false))
  end

  it("validates uniqueness of a description") do
    new_brand = Brand.new({:name => "Airwalks"})
    new_brand.save()
    new_brand2 = Brand.new({:name => "Airwalks"})
    expect(new_brand2.save()).to(eq(false))
  end

  it("validates uniqueness of a description") do
    new_brand = Brand.new({:name => "a".*(105)})
    expect(new_brand.save()).to(eq(false))
  end
end
