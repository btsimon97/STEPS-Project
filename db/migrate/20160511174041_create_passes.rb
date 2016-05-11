class CreatePasses < ActiveRecord::Migration
  def change
    create_table :passes do |t|

      t.timestamps null: false
    end
  end
end
