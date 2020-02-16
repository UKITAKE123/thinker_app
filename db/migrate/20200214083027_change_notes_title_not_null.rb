class ChangeNotesTitleNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :notes, :title, false
  end
end
