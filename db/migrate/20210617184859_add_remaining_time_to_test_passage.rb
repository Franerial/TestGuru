class AddRemainingTimeToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :remaining_time, :string, null: true
  end
end
