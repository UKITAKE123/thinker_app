class ChangeNotesMaintagNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :notes, :maintag, false
  end
end
