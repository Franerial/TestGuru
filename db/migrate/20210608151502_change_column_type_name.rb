class ChangeColumnTypeName < ActiveRecord::Migration[6.1]
  def change
    rename_column :badge_rules, :type, :rule_type
  end
end
