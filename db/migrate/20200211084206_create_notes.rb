class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.string :maintag
      t.string :subtag1
      t.string :subtag2

      t.timestamps
    end
  end
end
