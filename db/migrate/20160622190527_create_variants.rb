class CreateVariants < ActiveRecord::Migration

  def change
    create_table :variants do |t|
      t.string :size
      t.integer :cost
    end
  end

end
