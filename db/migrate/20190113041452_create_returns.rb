class CreateReturns < ActiveRecord::Migration[5.2]
  def change
    create_table :returns do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :retuncontent

      t.timestamps
    end
  end
end
