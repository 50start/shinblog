class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :text
      t.text :body

      t.timestamps
    end
  end
end
