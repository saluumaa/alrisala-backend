class RemoveImageFromNews < ActiveRecord::Migration[7.0]
  def change
    remove_column :news, :image, :binary
  end
end
