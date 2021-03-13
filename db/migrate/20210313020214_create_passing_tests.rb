class CreatePassingTests < ActiveRecord::Migration[6.1]
  def change
    create_table :passing_tests do |t|
      t.boolean :passed, default: false
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end
