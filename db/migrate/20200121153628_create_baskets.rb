class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.integer :user_id
      t.integer :origami_id
      t.timestamps
    end
  end
end
