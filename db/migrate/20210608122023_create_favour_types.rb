class CreateFavourTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :favour_types do |t|
      t.string :content

      t.timestamps
    end
  end
end
