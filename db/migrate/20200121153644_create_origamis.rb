class CreateOrigamis < ActiveRecord::Migration[6.0]
  def change
    create_table :origamis do |t|
      t.string :title
      t.string :category
      t.string :type
      t.integer :difficulty
      t.string :finished_image_url
      t.string :instruction_image_url
      t.string :description
      t.timestamps
    end
  end
end
