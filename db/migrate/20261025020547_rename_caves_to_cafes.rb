class RenameCavesToCafes < ActiveRecord::Migration[7.2]
  def change
    rename_table :caves, :cafes
  end
end
