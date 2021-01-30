class RemoveImageFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :image, :string
  end
end
