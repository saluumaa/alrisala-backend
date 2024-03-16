class ChangeImageColumnTypeInNews < ActiveRecord::Migration[7.0]
  def change
    change_column :news, :image, :binary, using: 'image::bytea'
  end
end
