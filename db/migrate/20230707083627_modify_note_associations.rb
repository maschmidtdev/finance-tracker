class ModifyNoteAssociations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :notes, :user, foreign_key: true
    remove_reference :notes, :stock, foreign_key: true
    add_reference :notes, :user_stock, foreign_key: true
  end
end
