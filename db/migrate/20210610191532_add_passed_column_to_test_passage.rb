class AddPassedColumnToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :sucessfully_passed, :boolean, default: false
  end
end
