class AddGroupsToEntity < ActiveRecord::Migration[7.0]
  def change
    change_table :entities do |t|
      t.references :group, null: false, foreign_key: true
   end
  end
end
