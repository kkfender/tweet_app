class AddDetailsToReturns < ActiveRecord::Migration[5.2]
  def change
    add_column :returns, :returnimage, :string
  end
end
