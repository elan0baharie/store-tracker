class AddStyleSpotForBrandTable < ActiveRecord::Migration[5.1]
  def change
    add_column(:brands, :style, :string)
  end
end
