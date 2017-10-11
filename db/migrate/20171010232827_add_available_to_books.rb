class AddAvailableToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :available, :boolean, default: false
  end
end
