class AddReferencesToPasses < ActiveRecord::Migration
  def change
    add_reference :passes, :user, index: true, foreign_key: true
    add_reference :passes, :student, index: true, foreign_key: true
  end
end
