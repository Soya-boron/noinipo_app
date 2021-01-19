class AddThemeIdToOpi < ActiveRecord::Migration[5.2]
  def change
    add_column:opinions,:theme_id,:integer
  end
end
