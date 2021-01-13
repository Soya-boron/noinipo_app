class CreateOpinionLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :opinion_likes do |t|
      t.integer :user_id
      t.integer :opinion_id

      t.timestamps
    end
  end
end
