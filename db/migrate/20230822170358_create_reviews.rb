class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.references :booking, null: false, foreign_key: true
      t.integer "rating", default: 0
      t.timestamps
    end
  end
end
