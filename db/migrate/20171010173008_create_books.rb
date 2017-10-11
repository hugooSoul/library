class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|

      t.string :name, default: ""
      t.string :author, default: ""
      t.string :category, default: ""
      t.datetime :published_date

      t.timestamps null: false
    end
  end
end
