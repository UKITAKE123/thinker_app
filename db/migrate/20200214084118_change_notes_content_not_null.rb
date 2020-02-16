class ChangeNotesContentNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :notes, :content, false
  end
end
