class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, limit: 50, null: false
      t.integer :level, default: 0
      t.references(:category, index: true, foreign_key: true, null: false)
      t.references(:user, index: true, foreign_key: true, null: false)
      t.timestamps
    end
  end
end
