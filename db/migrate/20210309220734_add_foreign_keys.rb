class AddForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tests, :categories
    add_foreign_key :questions, :tests
  end
end
