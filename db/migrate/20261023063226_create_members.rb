class CreateMembers < ActiveRecord::Migration[8.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :type
      t.integer :refered_by_id

      t.timestamps
    end
  end
end
