class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:presence => true, uniqueness: true, :length => { :maximum => 100 }})
  validates(:address, :presence => true)
  before_save(:capitalize_names)
  before_update(:resubmits_brands)
  private
    define_method(:capitalize_names) do
      self.name=(name().split(/ |\_|\-/).map(&:capitalize).join(" "))
    end

    define_method(:resubmits_brands) do
      if self.brand_ids == nil
      self.brand_ids = (brand_ids.id().all())
      end
    end
end
