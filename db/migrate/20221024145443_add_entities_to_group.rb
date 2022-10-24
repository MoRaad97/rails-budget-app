class AddEntitiesToGroup < ActiveRecord::Migration[7.0]
    def change
        change_table :groups do |t|
          t.references :entities, null: false, foreign_key: true
       end
    end 
end
