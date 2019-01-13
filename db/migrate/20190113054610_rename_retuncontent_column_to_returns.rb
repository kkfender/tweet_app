class RenameRetuncontentColumnToReturns < ActiveRecord::Migration[5.2]
  def change
      rename_column :returns, :retuncontent, :returncontent

  end
end
