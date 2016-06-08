class AddMoneyToTour < ActiveRecord::Migration
  def change
    add_column :tours, :money, :string
  end
end
