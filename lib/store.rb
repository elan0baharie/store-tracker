class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)

  before_validation(:capitalize_names)
  validates(:name, {:presence => true, uniqueness: true, :length => { :maximum => 100 }})
  validates(:address, :presence => true)

  define_method(:resubmits_brands) do
    all_brand = Brand.all
    store_brand = self.brands
    remain_brand = all_brand - store_brand
  end


  define_method(:capitalize_names) do
    self.name=(name().split(/ |\_|\-/).map(&:capitalize).join(" "))
  end
end
