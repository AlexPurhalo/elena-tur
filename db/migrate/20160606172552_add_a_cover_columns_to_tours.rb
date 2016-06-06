class AddACoverColumnsToTours < ActiveRecord::Migration
  def up
    add_attachment :tours, :cover
  end

  def down
    remove_attachment :tours, :cover
  end
end
