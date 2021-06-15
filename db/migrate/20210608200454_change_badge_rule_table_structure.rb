class ChangeBadgeRuleTableStructure < ActiveRecord::Migration[6.1]
  def change
    remove_column :badge_rules, :value
    change_column :badge_rules, :rule_type, :string, null: false
    add_index :badge_rules, :rule_type, unique: true
    add_index :badge_rules, :name, unique: true
  end
end
