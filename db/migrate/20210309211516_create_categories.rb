class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title, limit: 25, null: false
      t.timestamps
    end
  end
end
