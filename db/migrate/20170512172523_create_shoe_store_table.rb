class CreateShoeStoreTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string, :limit => 100)
      t.column(:address, :string, :limit => 100)
    end
  end
end
