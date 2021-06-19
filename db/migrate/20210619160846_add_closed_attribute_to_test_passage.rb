class AddClosedAttributeToTestPassage < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :closed, :boolean, default: false
  end
end
