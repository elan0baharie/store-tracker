class Store < ActiveRecord::Base

  validates(:name, :presence => true)
  
  private
    define_method(:capitalize_names) do
      self.name=(name().split(/ |\_|\-/).map(&:capitalize).join(" "))
    end
end
