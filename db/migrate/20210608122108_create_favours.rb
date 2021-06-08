class CreateFavours < ActiveRecord::Migration[6.0]
  def change
    create_table :favours do |t|
      t.string :duration
      t.string :description
      t.string :zone
      t.references :user, null: false, foreign_key: true
      t.references :favour_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
