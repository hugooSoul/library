class AddTakenToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :taken, :string, default: ""
  end
end
