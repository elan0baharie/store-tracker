class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  before_save(:capitalize_names)
  private
    define_method(:capitalize_names) do
      self.name=(name().split(/ |\_|\-/).map(&:capitalize).join(" "))
    end
end
