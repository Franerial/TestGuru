class DropTablePassingTests < ActiveRecord::Migration[6.1]
  def up
    drop_table :passing_tests, if_exists: true
  end
end
