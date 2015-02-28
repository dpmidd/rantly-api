class Rants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :title
      t.text :body
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
