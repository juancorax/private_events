class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :date
      t.string :location

      t.timestamps
    end
  end
end
