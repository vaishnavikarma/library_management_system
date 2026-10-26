class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :member, null: false, foreign_key: true
      t.references :reviewable, polymorphic: true, null: false
      t.text :text
      t.integer :rating

      t.timestamps
    end
  end
end
