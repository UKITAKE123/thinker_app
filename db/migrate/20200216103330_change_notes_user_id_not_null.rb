class ChangeNotesUserIdNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :notes, :user_id, false
  end
end