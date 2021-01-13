class CreateThemeFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :theme_follows do |t|
      t.integer :user_id
      t.integer :theme_id

      t.timestamps
    end
  end
end
