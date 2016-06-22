class CreateProductOils < ActiveRecord::Migration

  def change
    create_table :product_oils do |t|
      t.integer :product_id
      t.integer :oil_id
    end
  end

end
