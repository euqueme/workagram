class AddPictureToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :picture, :string
  end
end
